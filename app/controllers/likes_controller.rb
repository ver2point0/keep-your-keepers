class LikesController < ApplicationController
  
  def create
    @keeper = Keeper.find(params[:keeper_id])
    like = current_user.likes.build(keeper: @keeper)
    authorize like
    
    if like.save
      flash[:notice] = "\"#{@keeper.url}\"  was liked."
      redirect_to [@keeper.keep, @keeper]
    else
      flash[:error] = "\"#{@keeper.url}\"  failed to like."
      redirect_to [@keeper.keep, @keeper]
    end
  end
  
  def destroy
    @keeper = Keeper.find(params[:keeper_id])
    like = current_user.likes.find(params[:id])
    authorize like
    
    if like.destroy
      flash[:notice] = "\"#{@keeper.url}\"  was unliked."
      redirect_to [@keeper.keep, @keeper]
    else
      flash[:error] = "\"#{@keeper.url}\"  failed to unlike."
      redirect_to [@keeper.keep, @keeper]
    end
  end
end
