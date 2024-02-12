# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_item_id, only: %i[create]
  before_action :set_quantity, only: %i[create]

  def index
    @cart_items = @cart.cart_items
  end

  def create
    @cart.add_item(@item_id, @quantity)
    redirect_to carts_path
  end

  private

  def cart_params
    params.require(:cart).permit(:id, :quantity)
  end

  def set_item_id
    @item_id = params[:id]
  end

  def set_quantity
    @quantity = params[:quantity]
  end
end
