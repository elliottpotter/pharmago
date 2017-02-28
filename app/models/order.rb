class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :driver, optional: true
  has_many :order_products
  has_many :products, through: :order_products
end
