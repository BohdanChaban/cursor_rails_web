class ApplicationController < ActionController::Base
  before_action :set_current_cart
  # around_action :with_locale
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_cart
    session[:cart_id]||= Cart.create.id
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
  # def with_locale
  #   I18n.with_locale(params[:locale]) { yield }
  # end
  #
  # def default_url_options
  #   { locale: I18n.locale }
  # end
end
