class Cart < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  has_many :orders
  has_many :items, through: :orders

end
