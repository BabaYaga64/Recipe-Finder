# require 'httparty'

class Recipe
  # Include HTTParty mixin
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: key_value
  format :json

  # Define a for method that accepts a keyword for a search term
  def self.for (keyword)
    # Issue an HTTP GET request using the HTTParty gem
    # The GET request must have the "q=keyword" query argument and query "/search" route
    # The GET request returns the JSON payload document supplied in the recipes element of the hash (aka associative array) returned by HTTParty
    get("/search", query: {q: keyword})["recipes"]
  end
end
