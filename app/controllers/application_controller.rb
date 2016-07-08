class ApplicationController < ActionController::Base
  before_action :set_current_card
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_current_card
    session[:cart_id]||= Cart.create.id
  end

  def set_locale
    I18n.locale = params[:locale]
    # session[:locale] = params[:locale]
    # I18n.locale = session[:locale] if params[:locale].present?
    # I18n.locale = params[:locale] || I18n.default_locale
    # I18n.locale = params[:locale] if params[:locale].present?
  end
end
