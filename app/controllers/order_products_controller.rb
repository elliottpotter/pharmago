class OrderProductsController < ApplicationController

  def index
    @order_products        = Order_product.all
  end

  def show
    @order_product         = Order_product.find(params[:id])
  end

  def new
    @order_product         = OrderProduct.new
    @product               = @order_product.product.build
  end

  def create
    # quantity               = order_product_params[:quantity]
    # product                = params[:product]
    # product = Product.new(params[:order_product][:product])
    # @order_product         = OrderProduct.create(order_product_params)
    # @order_product.product = product
    # @order_product.save!
    respond_to do |format|
      format.js
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:quantity, products_attributes: [:name])
  end
end
