class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :cart, dependent: :destroy
  has_one :cart_id, through: :cart
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def confirmation_send
    UserMailer.confirmation_email.deliver_now
  end
end
