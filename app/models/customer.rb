class Customer < ApplicationRecord
  belongs_to :user
  has_many :customer_addresses
  has_many :orders
end
