class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  # def destroy
  #   Item.delete(params[:id])
  #   # render json: status: :no_content
  # end
end
