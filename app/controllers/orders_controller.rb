class OrdersController < ApplicationController
  def index
    @orders         = Order.all
    authorize @orders
  end

  def show
    @order          = Order.find(params[:id])
    @customer       = Customer.find(current_user.customer)
    @customer_address = CustomerAddress.new
    @customer_addresses = CustomerAddress.where(customer_id: current_user)
    authorize @order
  end

  def new
    @order          = current_user.customer.orders.build
    @products       = Product.all
    @order_products = []
    authorize @products
    # authorize @order_products
  end

  def create
    @order = current_user.customer.orders.create(order_params)
    redirect_to order_path(@order)
    authorize @order
  end

  def claim
    @order          = Order.find(params[:id])
    @order.claim!
    @order.driver   = current_user.driver
    @order.save!
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:id, order_products_attributes: [ :quantity, :product_id, products_attributes: [:name] ])
  end
end
