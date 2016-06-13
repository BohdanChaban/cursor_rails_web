class CartsController < ApplicationController

  def show
    @products_in_cart = Product.where(cart_id: session[:cart_id])
  end
end
