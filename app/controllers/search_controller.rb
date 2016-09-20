class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV["API_KEY"]}&pageSize=20&callback=JSON_CALLBACK&format=json")
    # data = JSON.parse(response.body.delete("JSON_CALLBACK" ) )
    require 'pry'; binding.pry
  end
end
