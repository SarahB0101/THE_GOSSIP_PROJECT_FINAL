class CitiesController < ApplicationController
  def show
  	id = params[:id]
  	@city = City.all.find(id) 
  end
end
