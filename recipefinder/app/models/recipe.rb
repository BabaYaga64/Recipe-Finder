# require 'httparty'

class Recipe
  # Include HTTParty mixin
  include HTTParty

  # Define a base uri to use for Food2Fork
  base_uri "http://food2fork.com/api"
  # Define a default query param set to your environment variable
  default_params key: ENV["FOOD2FORK_KEY"]
  # Specify the desired format as json
  format :json

  # Define a for method that accepts a keyword for a search term
  def self.for (keyword)
    # Issue an HTTP GET request using the HTTParty gem
    # The GET request must have the "q=keyword" query argument and query "/search" route
    # The GET request returns the JSON payload document supplied in the recipes element of the hash (aka associative array) returned by HTTParty
    get("/search", query: {q: keyword})["recipes"]
  end
end
