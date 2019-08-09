class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]
	def new
		@gossip = Gossip.all.find(params[:gossip_id])
		@comment = Comment.new
	end

	def create
		@gossip = Gossip.all.find(params[:gossip_id])
		@comment = Comment.create(content: post_params[:content], gossip: @gossip, user: current_user)
		puts "£" * 60
		puts post_params[:content]
		puts "£" * 60
		
  	
	  	if @comment.save
	  		flash[:success1] = " "
	  		redirect_to gossip_path(params[:gossip_id])
	  	else
	  		redirect_to gossip_path(params[:gossip_id])	
	  	end
	end

	def edit
		@comment = Comment.all.find(params[:id])
		@gossip = Gossip.all.find(params[:gossip_id])


	end

	def update
		@comment = Comment.find(params[:id])
		@gossip = Gossip.find(params[:gossip_id])

	    if @comment.update(content: params[:content], user: current_user)
	      flash[:success2] = " "
	      redirect_to gossip_path(params[:gossip_id])
	     else
	     render :edit 
    end
		
	end

	def destroy

		  @comment = Comment.all.find(params[:id])
		  @gossip = Gossip.find(params[:gossip_id])
	      @comment.destroy
	      
	       if flash[:success3] = " "
	      redirect_to gossip_path(params[:gossip_id])
	      else
	      render gossip_path(params[:gossip_id])
	  	end
		
	end


	private 

	def post_params

		params.require(:comment).permit(:content)
		
	end



  	def authenticate_user
	    unless current_user
	      flash[:danger] = "Please log in."
	      redirect_to new_session_path
	    end
  end

end
