class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_attachment :photo

  def to_s
    name
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    @product.photo_url = product_params[:photo_url]
    @product.save!
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo)
  end

end
