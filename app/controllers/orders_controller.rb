class OrdersController < ApplicationController
  def index
    @orders         = Order.all
  end

  def show
    @order          = Order.find(params[:id])
    @order          = Order.new
  end

  def new
    @order          = current_user.customer.orders.build
    @products       = Product.all
    3.times         { @order.order_products.build }
  end

  def create
    raise
    @order = current_user.customer.orders.create(order_params)
    redirect_to order_path(@order)
  end

  def order_params
    params.require(:order).permit(order_products_attributes: [:quantity, :product_id, products_attributes: [:name]])
  end
end
