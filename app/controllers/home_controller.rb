class HomeController < ApplicationController
  def index
  	@occasions = Occasion.last(5)
  end
end
