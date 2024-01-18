# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# if Rails.env.development?
(1..8).each do |i|
  Item.find_or_create_by!(name: "item#{i}") do |item|
    item.description = "description#{i}"
    item.price = i * 11.11
    item.image.attach(io: File.open(Rails.root.join('db/seeds/images/baby-onepiece.jpeg')),
                      filename: 'baby-onepiece.jpeg')
  end
end
# end
