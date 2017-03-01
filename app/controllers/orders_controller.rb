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
    @product        = Product.new
    @order_product  = @order.order_products.build
  end

  def create
  end

    def order_product_params
    params.require(:order).permit(order_products_attributes: [:quantity, product_attributes: [:name]])
  end
end
