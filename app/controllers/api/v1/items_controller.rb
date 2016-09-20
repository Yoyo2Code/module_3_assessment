class Api::V1::ItemsController < ApplicationController
  def index
    # render json: Item.all
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
