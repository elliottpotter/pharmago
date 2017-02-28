class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    Product.create(params[:product])
    #raise
  end

end
