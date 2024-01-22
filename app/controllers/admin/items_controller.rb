# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    def index
      @items = Item.all
    end

    def new
    end
  end
end
