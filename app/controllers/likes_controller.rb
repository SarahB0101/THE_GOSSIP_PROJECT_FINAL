class LikesController < ApplicationController
  before_action :find_gossip
  before_action :find_like, only: [:destroy]
  def create
    if already_liked?
      
    else
      @gossip.likes.create(user: current_user)
    end
    redirect_back fallback_location: gossips_path
  end
  def destroy
    @like.destroy
    redirect_back fallback_location: gossips_path
  end
  private
  def find_gossip
    @gossip = Gossip.find(params[:gossip_id])
  end
  def already_liked?
    Like.where(user_id: current_user.id, gossip_id:
    params[:gossip_id]).exists?
  end
  def find_like
    @like = @gossip.likes.find(params[:id])
 end
end