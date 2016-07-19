class User < ActiveRecord::Base
  after_create :create_account_with_cart

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2, :facebook, :vkontakte]

  has_one :account

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    unless user
      user = User.create(email: data['email'],
                         password: Devise.friendly_token[0, 20])
    end
    user
  end

  def self.find_for_facebook_oauth(access_token)
    user_fb = User.where(url: access_token.info.urls.Facebook).first
    unless user_fb
      user_fb = User.create!(:email => access_token.extra.raw_info.email,
                   :password => Devise.friendly_token[0,20])
    end
    user_fb
  end

  def self.find_for_vkontakte_oauth(access_token)
    user = User.where(url: access_token.info.urls.Vkontakte).first
    unless user
      user = User.create!(:email => access_token.extra.raw_info.domain+'@vk.com',
                   :password => Devise.friendly_token[0,20])
    end
    user
  end

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
