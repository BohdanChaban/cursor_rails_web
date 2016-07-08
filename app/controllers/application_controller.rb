class ApplicationController < ActionController::Base
  before_action :set_current_card
  around_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_card
    session[:cart_id]||= Cart.create.id
  end

  def set_locale
    I18n.set_locale(params[:locale]) { yield }
  end

  def default_url_options(options = {})
    { locale: I18n.locale }
  end
end
