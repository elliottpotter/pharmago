class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products

  def to_s
    name
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

end
