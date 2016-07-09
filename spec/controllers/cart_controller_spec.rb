require 'rails_helper'

describe CartsController do

  it do
    get :show
    expect(assigns[:carts]).to be_nil
  end

  it 'should send confirmation email' do
    email = 'example@gmail.com'
    post :send_mail, email: email
  end

  it 'should show order'do
    get :order
  end
end
