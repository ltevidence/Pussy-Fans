class Order < ApplicationRecord
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders

  after_create :confirm_email

  def confirm_email
    UserMailer.confirm_email(self).deliver_now
  end
end
