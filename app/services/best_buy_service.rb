class BestBuyService

  def initialize
    @connection = Faraday.new(:url => 'https://api.bestbuy.com/v1/') do |faraday|
                  faraday.request  :url_encoded
                  faraday.adapter  Faraday.default_adapter
    end
  end

  def find_nearby_stores(zipcode)
    response = @connection.get("stores((area(#{zipcode},25)))?apiKey=#{ENV["API_KEY"]}&pageSize=20&format=json")
    data = parse_store_data(response.body)
    StoreLoader.load_stores(data)
  end

  def parse_store_data(data)
    JSON.parse(data)["stores"]
  end
end
