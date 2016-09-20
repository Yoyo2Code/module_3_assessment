class SearchController < ApplicationController
  def index
    response = Faraday.get("https://api.bestbuy.com/v1/stores((area(80202,25)))?apiKey=#{ENV["API_KEY"]}&pageSize=20&format=json")
    data = JSON.parse(response.body)["stores"]
    @stores = data.map do |store|
       store_data = { long_name: store["longName"],
                      city: store["city"],
                      distance: store["distance"],
                      phone_number: store["phone"],
                      store_type: store["storeType"] }

      OpenStruct.new(store_data)
    end
    # stores have 17 results
  end
end
