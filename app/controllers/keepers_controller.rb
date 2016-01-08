class KeepersController < ApplicationController
  
  def show
  end

  def new
    @keeper = Keeper.new
  end
  
  def create
    @keep = Keep.find(params[:id])
    @keeper = @keep.keepers.build(keepers_params)
      
    if @keeper.save
      flash[:notice] = "Keeper was saved."
      redirect_to root_path
    else
      flash[:error] = "Keeper failed to save."
      render :new
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def keepers_params
    params.require(:keeper).permit(:url)
  end
end
