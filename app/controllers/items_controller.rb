# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @items = Item.where.not(id: @item.id).order(created_at: :desc).limit(4)
  end
end
