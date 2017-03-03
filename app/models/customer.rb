class Customer < ApplicationRecord
  belongs_to :user
  has_many :customer_addresses
  has_many :orders
  def full_name
    "#{user.firt_name} #{user.last_name}"
  end
end
