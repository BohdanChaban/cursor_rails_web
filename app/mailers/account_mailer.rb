class AccountMailer < ApplicationMailer
  default form: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'https://morning-caverns-29306.herokuapp.com'
    mail(to: @user.name, subject: 'Welcome to our site!')
  end

end
