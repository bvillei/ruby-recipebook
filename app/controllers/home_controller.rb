class HomeController < ApplicationController
  def welcome
      @recipe = Recipe.order("RAND()").first
  end
end
