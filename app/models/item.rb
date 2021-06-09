class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 3..45 }
  validates :description, length: {maximum: 200}
  validates :price, presence: true 
  validates :image_url, presence: true

  has_many :item_carts
  has_many :carts, through: :item_carts
  has_many :item_orders
  has_many :items, through: :item_orders
end
