class ProductsController < ApplicationController

  def new
    @product = Product.new
    authorize @product
  end

  def create
    Product.create(product_params)
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end

end
