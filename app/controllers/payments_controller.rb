class PaymentsController < ApplicationController
  before_action :set_order

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount,
    description:  "Payment for order #{@order.id}",
    currency:     @order.amount.currency
  )
  @order.update(payment: charge.to_json)
  # make aasm_state go from unpaid to unclaimed
  @order.unclaim
  @order.save!
  redirect_to customer_path(current_user)

  authorize @order

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_order_payment_path(@order)
    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end
end
