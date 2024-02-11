# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :delete_all
  has_many :items, through: :cart_items

  def add_item(item_id, quantity = 1)
    cart_item = cart_items.find_or_initialize_by(item_id:)
    cart_item.update(quantity: cart_item.quantity + quantity.to_i)
  end

  def total_quantity
    Rails.logger.debug cart_items
    cart_items.sum(:quantity)
  end
end
