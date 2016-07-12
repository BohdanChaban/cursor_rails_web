class OrderMailer < ApplicationMailer

  default from: 'cursorshop@gmail.com'
  def order_email(email, price)
    @order_price = price
    @url = 'https://morning-caverns-29306.herokuapp.com'
    mail(to: email, subject: 'Order from Cursor Shop')
  end

end
