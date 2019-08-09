class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def show
  	@id = params[:id]
    @gossip = Gossip.all.find(params[:id])
  	@comment = Comment.new
    @tags = Tag.all
  end


  def new
  	@gossip = Gossip.new
     @tags = Tag.all
  end



  def create
  	@gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    #tag = Tag.find(params[:tag])
    #@join_table_gossip_tag = JoinTableGossipTag.create(gossip: @gossip, tag: tag)
  	
  	if @gossip.save
  		flash[:success]
  		redirect_to index_path
  	else
  		render new_gossip_path	
  	end

  end

  def edit
      @id = params[:id]
      @gossip = Gossip.all.find(@id)
      @tags = Tag.all
  end


  def update
    @gossip = Gossip.find(params[:id])
    #tag = Tag.find(params[:tag])
    #join_table_gossip_tag = JoinTableGossipTag.where(gossip_id: @gossip.id)
    #join_table_gossip_tag.each do |join| join.update(gossip: @gossip, tag: tag)
    #end
    
    if @gossip.update(title: params[:title], content: params[:content], user: current_user)
      flash[:success] = "Ton gossip est bien modifié !"
      redirect_to gossip_path
     else
     render :edit 
    end
    
  end

  def destroy
     

      @gossip = Gossip.all.find(params[:id])
      @gossip.destroy
      
       if flash[:success1] = "Ton gossip a bien été supprimé !"
      redirect_to index_path
      else
      render gossip_path

      end
  end




  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end



end
