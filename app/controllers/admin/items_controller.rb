# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      respond_to do |format|
        if @item.save
          format.html { redirect_to admin_items_path, notice: 'item was successfully created.' }
          format.json { render :index, status: :created, location: @item }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def item_params
      # params.permit(:name, :price, :description)
      params.require(:item).permit(:name, :price, :description)
    end
  end
end
