class UsersController < ApplicationController
  def show
  	@id = params[:id]
    @first_name = User.all.find(@id).first_name
  	@users = User.all.find(@id)
  end

  def new
    @user = User.new
  end

  def create
   puts "£" * 60
    puts params
    puts "£" * 60
    city = City.find_or_create_by(name: params[:name], zip_code: params[:zip_code])
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: city, age: params[:age], description: params[:description], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save 
          flash[:success_user_signup] = ""
          session[:user_id] = @user.id
          redirect_to index_path
      else
          render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private 

  def post_params
    params.require(:user).permit(:first_name, :last_name, :email, :age, :zip_code, :city, :description, :password, :password_confirmation)
  end

end
