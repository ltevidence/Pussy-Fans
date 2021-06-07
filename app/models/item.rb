class Item < ApplicationRecord
  validates :title, uniqueness: true, presence: true, length: { in: 3..45 }
  validates :description, length: {maximum: 200}
  validates :price, presence: true 
  validates :image_url, presence: true
end
