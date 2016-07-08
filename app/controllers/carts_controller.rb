class CartsController < ApplicationController

  def show
    @products_in_cart = Product.where(cart_id: session[:cart_id])
  end

  def add
    Cart.find(session[:cart_id]).products << Product.find(params[:product_id])
  end

  def order
    @total_price_of_order = total_price_of_order
  end

  private

  def total_price_of_order
    Cart.find(session[:cart_id]).products.sum("price")
  end
end
