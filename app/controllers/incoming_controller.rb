class IncomingController < ApplicationController
  
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!
  
  def create
    
    @user = User.find_by(email: params[:sender])
    @keep = Keep.find_by(title: params[:subject].downcase)
    @url = params[:"body-plain"]
    
    # create and save new user if user.nil
    if @user.nil?
      @user = User.new(email: params[:sender], password: ENV['DEFAULT_PASSWORD'])
      @user.skip_confirmation!
      @user.save!
    end
    
    # create and save new keep if keep.nil
    if @keep.nil?
      @keep = @user.keeps.create(title: params[:subject])
      @keep.save!
    end
    
    # build and save a new keeper
    @keeper = @keep.keepers.build(url: @url)
    @keeper.save!
    
    # assuming everything went well
    head 200
  end
end
