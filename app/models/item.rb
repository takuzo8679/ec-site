# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  name        :string           not null
#  price       :decimal(7, 2)    not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
  has_one_attached :image
  validates :name, { presence: true }
  validates :price, { presence: true }
  validates :description, { presence: true }
  validates :image, { presence: true }
end
