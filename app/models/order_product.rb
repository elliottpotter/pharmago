class OrderProduct < ApplicationRecord
  belongs_to :order, inverse_of: :order_products
  belongs_to :product

  accepts_nested_attributes_for :product
end
