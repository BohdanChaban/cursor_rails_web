class CartsController < ApplicationController

  def show
    @products_in_cart = Product.where(cart_id: session[:cart_id])
  end

  def add
    Cart.find(session[:cart_id]).products << Product.find(params[:product_id])
  end

  def remove
    Cart.find(session[:cart_id]).products.find(params[:product_id]).update(cart_id: nil)
    redirect_to cart_path
  end

  def order
    @total_price_of_order = total_price_of_order
  end

  def send_mail
    order_price = total_price_of_order
    email = params[:email]
    OrderMailer.order_email(email, order_price).deliver
    redirect_to products_path
    Cart.find(session[:cart_id]).products.each do |p|
      p.update(cart_id: nil)
    end
  end

  private

  def total_price_of_order
    Cart.find(session[:cart_id]).products.sum('price')
  end
end
