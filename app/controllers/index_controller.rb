class IndexController < ApplicationController
  def show
  	@tags = Tag.all
  end
end
