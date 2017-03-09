class OrdersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @orders             = Order.all
    authorize @orders
  end

  def add_to_cart
    order               = Order.find(params[:id])
    order_products      = JSON.parse(params[:json])

    order_products.each do |id, quantity|
      order.order_products.create(product: Product.find(id), quantity: quantity)
    end
    authorize order
    redirect_to order_path(order)
  end

  def show
    @order              = Order.find(params[:id])
    @customer           = Customer.find(current_user.customer)
    @customer_address   = CustomerAddress.new
    @customer_addresses = CustomerAddress.where(customer_id: current_user)
    @order.amount       = calculate_amount(@order)
    @order.save!
    authorize @order
  end

  def new
    @order              = current_user.customer.orders.create
    @products           = Product.all
    authorize @products
  end

  def create
    @order = current_user.customer.orders.create(order_params)
    redirect_to order_path(@order)
    authorize @order
  end

  def calculate_amount(order)
    sum = 0
    order.order_products.each do |order_product|
      subsum = order_product.quantity * order_product.product.amount_cents
      sum += subsum
    end
    return sum
  end

  def claim
    @order              = Order.find(params[:id])
    @order.claim!
    @order.driver       = current_user.driver
    @order.save!
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:id, order_products_attributes: [ :quantity, :product_id, products_attributes: [:name] ])
  end
end
