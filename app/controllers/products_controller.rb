class ProductsController < ApplicationController
  before_action :initialize_session, only: :index
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    # session[:view_count] += 1
  end

  def new
    @product =Product.new
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:create] = "Product was successfully created."
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @product.destroy
    flash[:destroy] = "Product was successfully destroyed."
    redirect_to products_path #, notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def initialize_session
    session[:view_count] ||= 0
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
