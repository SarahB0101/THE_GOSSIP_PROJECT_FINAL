class SessionsController < ApplicationController

	def new

	#@session = Session.new
		
	end


	def create

  	  # cherche s'il existe un utilisateur en base avec l’e-mail
	  user = User.find_by(email: params[:email])

	  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    # redirige où tu veux, avec un flash ou pas
	    flash[:success_signin] = " "
	    
	    log_in user
    	params[:remember_me] == '1' ? remember(user) : forget(user)
	    redirect_to index_path #(session[:user_id])
	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
		
	end


	def destroy
		log_out if logged_in?
	# session.delete(:user_id)
		redirect_to index_path
		
	end
end
