class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params)
  end

  def destroy
    Item.delete(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
