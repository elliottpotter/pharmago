class OrderProductsController < ApplicationController

  def index
    @order_products        = Order_product.all
  end

  def show
    @order_product         = Order_product.find(params[:id])
  end

  def new
    @order_product         = OrderProduct.new
    @product = @order_product.product.build
  end

  def create
    quantity               = order_product_params[:quantity]
    product                = params[:product]
    # @order_product         = OrderProduct.new(quantity: quantity)
    # @order_product.product = product
    # @order_product.save!
  end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity, product_attributes: [:name])
  end
end
