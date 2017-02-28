class OrdersController < ApplicationController
  def index
    @orders         = Order.all
  end

  def show
    @order          = Order.find(params[:id])
    @order          = Order.new
  end

  def new
    @order          = Order.new
    @order_product  = Product.new
    #@order_product  = OrderProduct.new
  end

  def create
  end
end
