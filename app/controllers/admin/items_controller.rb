# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth
    before_action :set_item, only: %i[destroy edit update]

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

    def destroy
      respond_to do |format|
        if @item.destroy!
          format.html do
            redirect_to admin_items_path, notice: "Id: #{@item.id}(name: #{@item.name}) is successfully deleteted"
          end
        else
          format.html { render :index, status: :unprocessable_entity }
        end
      end
    end

    def edit; end

    def update
      respond_to do |format|
        if @item.update!(item_params)
          format.html do
            redirect_to admin_items_path, notice: "Id: #{@item.id}(name: #{@item.name}) is successfully updated"
          end
        else
          format.html { render :index, status: :unprocessable_entity }
        end
      end
    end

    private

    def item_params
      # params.permit(:name, :price, :description)
      params.require(:item).permit(:name, :price, :description, :image)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end
end
