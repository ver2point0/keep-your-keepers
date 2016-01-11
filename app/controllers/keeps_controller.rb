class KeepsController < ApplicationController
  
  def show
    @keep = Keep.find(params[:id])
  end

  def new
    @keep = Keep.new
  end

  def create
    @keep = current_user.keeps.new(keeps_params)
    
    if @keep.save
      flash[:notice] = "\"#{@keep.title}\" was saved."
      redirect_to root_path
    else
      flash[:error] = "\"#{@keep.title}\"failed to save."
      render :new
    end
  end
  
  def edit
    @keep = Keep.find(params[:id])
  end
  
  def update
    @keep = Keep.find(params[:id])
    @keep.assign_attributes(keeps_params)
    
    if @keep.save
      flash[:notice] = "\"#{@keep.title}\" successfully updated."
      redirect_to root_path
    else
      flash[:error] = "\"#{@keep.title}\" failed to update."
      render :edit
    end
  end
  
  def destroy
    @keep = Keep.find(params[:id])
    
    if @keep.destroy
      flash[:notice] = "\"#{@keep.title}\" successfully deleted."
      redirect_to root_path
    else
      flash[:error] = "\"#{@keep.title}\" failed to delete."
      redirect_to root_path
    end
  end
  
  private
  
  def keeps_params
    params.require(:keep).permit(:title)
  end

end
