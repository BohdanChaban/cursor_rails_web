class User < ActiveRecord::Base
  after_create :create_account_with_cart

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  has_one :account

  private

  def create_account_with_cart
    @user = User.last
    @account_user = Account.new(name: 'firstname', age: '19')
    @cart = Cart.new
    @user.account = @account_user
    @user.account.cart = @cart
    @user.save
    @account_user.save
    @cart.save
  end
end
