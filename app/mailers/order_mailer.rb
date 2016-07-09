class OrderMailer < ApplicationMailer

  def order_email(email, price)
    @email = email
    @price = price
    @url = 'https://morning-caverns-29306.herokuapp.com'
    mail(to: @email, subject: 'Order from Cursor Shop')
  end

end
