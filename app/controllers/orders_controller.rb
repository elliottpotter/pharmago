class OrdersController < ApplicationController
  def index
    @orders         = Order.all
    authorize @orders
  end

  def show
    @order          = Order.find(params[:id])
    authorize @order
  end

  def new
    @order          = current_user.customer.orders.build
    @products       = Product.all
    3.times         { @order.order_products.build }
    authorize @products
  end

  def create
    @order = current_user.customer.orders.create(order_params)
    redirect_to order_path(@order)
    authorize @order
  end

  def order_params
    params.require(:order).permit(order_products_attributes: [ :quantity, :product_id, products_attributes: [:name] ])
  end
end
