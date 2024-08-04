class Seller < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :contact_info, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user_id, presence: true
end
