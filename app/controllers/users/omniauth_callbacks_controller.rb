class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      flash[:success] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Google'
      sign_in_and_redirect @user, :event => :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def facebook
    @user = User.find_for_facebook_oauth request.env['omniauth.auth']
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Facebook'
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = 'authentication error'
      redirect_to root_path
    end
  end

  def vkontakte
    @user = User.find_for_vkontakte_oauth request.env['omniauth.auth']
    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', :kind => 'Vkontakte'
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = 'authentication error'
      redirect_to root_path
    end
  end

end