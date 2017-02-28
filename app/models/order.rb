class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver
  has_many :products, through: :order_products
end
