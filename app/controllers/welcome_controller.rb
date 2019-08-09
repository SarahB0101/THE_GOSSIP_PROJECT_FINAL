class WelcomeController < ApplicationController
  def show
  	@user = params[:user_entry]
  end
end
