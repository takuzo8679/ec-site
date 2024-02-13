# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_item_id, only: %i[create destroy]
  before_action :set_quantity, only: %i[create]

  def index
    @cart_items = @cart.cart_items
  end

  def create
    respond_to do |format|
      if @cart.add_item(@item_id, @quantity)
        format.html { redirect_to carts_path }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @cart.cart_items.find(@item_id).destroy
        format.html { redirect_to carts_path }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end
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
