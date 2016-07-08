class AccountPreview < ActionMailer::Preview
  def welcome
    AccountMailer.welcome_email(Account.first)
  end
end