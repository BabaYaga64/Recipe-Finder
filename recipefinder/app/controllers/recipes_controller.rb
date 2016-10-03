class RecipesController < ApplicationController
  def index
  	# Check if a request parameter search was passed in

  	# Use the search term as the keyword if supplied. Use a default value of 'chocolate' if not supplied. 
  	@search_term = params[:search] || 'chocolate'
  	@recipes = Recipe.for(@search_term)

  end
end
