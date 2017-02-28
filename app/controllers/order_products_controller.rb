class OrderProductsController < ApplicationController
  def index
    @order_products = Order_product.all
  end

  def show
    @order_product = Order_product.find(params[:id])
  end
end
