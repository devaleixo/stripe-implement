class OrdersController < ApplicationController
  def show
  end

  def create
    teddy = Teddy.find(params[:teddy_id])
    order  = Order.create!(teddy: teddy, amount: teddy.price, state: 'pending', user: current_user)

  session = Stripe::Checkout::Session.create(
    payment_method_types: ['card', 'pix'],
    line_items: [{
      name: teddy.sku,
      images: [teddy.photo_url],
      amount: teddy.price_cents,
      currency: 'brl',
      quantity: 1
    }],
    success_url: order_url(order),
    cancel_url: order_url(order)
  )

  order.update(checkout_session_id: session.id)
  redirect_to new_order_payment_path(order)
  end
end
