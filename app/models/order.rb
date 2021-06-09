class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :item

  after_create :confirm_email

  def confirm_email
    UserMailer.confirm_email(self).deliver_now
  end

end
