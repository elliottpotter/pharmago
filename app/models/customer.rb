class Customer < ApplicationRecord
  belongs_to :user
  has_many :customer_addresses
end
