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
    OrderMailer.order_email(params[:email], total_price_of_order).deliver_later
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
