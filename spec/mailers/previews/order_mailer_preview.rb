# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview
  def order_email
    OrderMailer.order_email('example@gmail.com', 5555.55)
  end
end
