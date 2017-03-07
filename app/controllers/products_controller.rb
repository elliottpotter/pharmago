class ProductsController < ApplicationController

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.create(product_params)
    @product.photo_url = product_params[:photo_url]
    raise
    @product.save!
    redirect_to new_product_path
    authorize @product
  end

  private

  def product_params
    params.require(:product).permit(:name, :photo_url)
  end

end
