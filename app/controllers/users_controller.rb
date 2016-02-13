class UsersController < ApplicationController
  
  def show
    @user_keepers = current_user.keeps.map(&:keepers)
    @liked_keepers = current_user.likes.map(&:keeper)
  end
  
end
