class Item < ApplicationRecord
  validates :title, presence: true, length: { in: 3..45 }
  validates :description, length: {maximum: 200}
  validates :price, presence: true 
  validates :image_url, presence: true

  has_many :orders
  has_many :cart, through: :orders
end
