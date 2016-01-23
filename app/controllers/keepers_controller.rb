class KeepersController < ApplicationController
  
  def show
    @keep = Keep.find(params[:keep_id])
    @keeper = @keep.keepers.find(params[:id])
  end

  def new
    @keep = Keep.find(params[:keep_id])
    @keeper = Keeper.new
    authorize @keeper
  end
  
  def create
    @keep = Keep.find(params[:keep_id])
    @keeper = @keep.keepers.build(keepers_params)
    authorize @keeper
    
    if @keeper.save
      flash[:notice] = "\"#{@keeper.url}\"  was saved."
      redirect_to user_keep_path(current_user, @keep)
    else
      flash[:error] = "\"#{@keeper.url}\"  failed to save."
      render :new
    end
  end
  
  def edit
    @keep = Keep.find(params[:keep_id])
    @keeper = @keep.keepers.find(params[:id])
    authorize @keeper
  end
  
  def update
    @keep = Keep.find(params[:keep_id])
    @keeper = @keep.keepers.find(params[:id])
    @keeper.assign_attributes(keepers_params)
    authorize @keeper
    
    if @keeper.save
      flash[:notice] = "\"#{@keeper.url}\" successfully updated."
      redirect_to user_keep_path(current_user, @keep)
    else
      flash[:error] = "\"#{@keeper.url}\" failed to update."
      render :edit
    end
  end
  
  def destroy
    @keep = Keep.find(params[:keep_id])
    @keeper = Keeper.find(params[:id])
    authorize @keeper
    
    if @keeper.destroy
      flash[:notice] = "\"#{@keeper.url}\" successfully deleted."
      redirect_to user_keep_path(current_user, @keep)
    else
      flash[:error] = "\"#{@keeper.url}\" failed to delete."
      redirect_to root_path
    end
  end
  
  def keepers_params
    params.require(:keeper).permit(:url)
  end
end
