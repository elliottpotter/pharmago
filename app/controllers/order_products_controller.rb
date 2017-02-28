class OrderProductsController < ApplicationController
  def index
    @order_products = Order_product.all
  end

  def show
    @order_product = Order_product.find(params[:id])
  end

  def create
    @order = Order.find(params[:order_id])
    @order_product = Order_product.new(order_product_params)
    @order_product.order = @order
    if @order_product.save
      redirect_to order_path(@order)
    else
      render '/'
    end
  end

  private

  def order_product_params
    params.require(:order_product)

    # .permit(:quantity)
  end

end
