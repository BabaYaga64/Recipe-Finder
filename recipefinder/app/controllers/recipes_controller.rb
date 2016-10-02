class RecipesController < ApplicationController
  def index
  	# Check if a request parameter search was passed in

  	# Use the search term as the keyword if supplied. Use a default value of 'chocolate' if not supplied. 
  	if !params[:search].nil?
  	else
  		params[:search] = "chocolate"
  end
  	@recipes = Recipe.for(params[:search])
  end
end
