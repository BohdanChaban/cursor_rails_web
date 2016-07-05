require 'rails_helper'

describe CartsController do

  it do
    get :show
    expect(assigns[:carts]).to be_nil
  end
end
