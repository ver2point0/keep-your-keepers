class KeepsController < ApplicationController
  
  def show
    @keep_show = Keep.find(params[:id])
  end

  def new
    @keep = Keep.new
  end

  def create
    @keep = current_user.keeps.new(keeps_params)
    
    if @keep.save
      flash.now[:notice] = "Keep was saved."
      redirect_to root_path
    else
      flash.now[:error] = "Keep failed to save."
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @keep = Keep.find(params[:id])
    
    if @keep.destroy
      flash.now[:notice] = "\"#{@keep.title}\" successfully deleted."
      redirect_to root_path
    else
      flash.now[:error] = "\"#{@keep.title}\" failed to delete."
      redirect_to root_path
    end
  end
  
  private
  
  def keeps_params
    params.require(:keep).permit(:title)
  end

end
