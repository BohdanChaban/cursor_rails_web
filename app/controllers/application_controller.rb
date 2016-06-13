class ApplicationController < ActionController::Base
  before_action :set_current_card

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_card
    session[:cart_id]||= Cart.create.id
  end
end
