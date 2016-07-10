require 'rails_helper'

describe ProductsController do

  it 'assigns @products variable' do
    prod = create(:product)
    get :index
    expect(assigns[:products]).not_to be_nil
    expect(assigns[:products].first.name).to eql(prod.name)
  end

  it 'assigns @product variable' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    get :new
    expect(assigns[:product]).not_to be_nil
  end

  it 'should create new product' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    post :create, product: {name:'Smartphone', description: 'Lenovo', price: 4999.99}
    expect(assigns[:product]).not_to be_nil
    expect(assigns[:product].errors.size).to eql(0)
    expect(Product.where(name: 'Smartphone').first).not_to be_nil
  end

  it 'should not create new product' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    post :create, product: {name:'TV', price: -10}
    expect(assigns[:product]).not_to be_nil
    expect(assigns[:product].errors.size).to eql(1)
    expect(assigns[:product].errors.messages[:price]).not_to be_nil
    expect(Product.where(name: 'TV').first).to be_nil
  end

  it 'should update product' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    prod = create(:product)
    put :update, id: prod.id, product: {name:'TV', description: 'Full HD', price: 5999.99}
    expect(response).to be_redirect
  end

  it 'should not update product, render edit' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    prod = create(:product)
    put :update, id: prod.id, product: {name:'', price: -9999.99}
    expect(response).to render_template :edit
  end

  it 'should delete product, redirect to products' do
    @request.env['devise.mapping'] = Devise.mappings[:user]
    user = create(:user)
    sign_in :user, user
    prod = create(:product)
    delete :destroy, id: prod.id, product: {name:'TV', description: 'Full HD', price: 5999.99}
    expect(response).to redirect_to products_path
  end
end