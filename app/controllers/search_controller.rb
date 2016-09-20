class SearchController < ApplicationController
  def index
    @data = BestBuyService.new.find_nearby_stores(params[:query])
    @store_count = @data.count
    @stores = @data[0..14]
  end
end
