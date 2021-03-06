class AccountsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all.order(:age)
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        AccountMailer.welcome_email(@account).deliver_later
        account_create = I18n.t 'account_create'
        format.html { redirect_to @account, notice: account_create }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        account_update = I18n.t 'account_update'
        format.html { redirect_to @account, notice: account_update }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    account_destroy = I18n.t 'account_destroy'
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: account_destroy }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_account
    @account = Account.find(params[:id])
  end

  # Never trust parameters from the scary internet,
  # only allow the white list through.
  def account_params
    params.require(:account).permit(:name, :age)
  end
end
