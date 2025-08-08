class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:destroy]


  def index
    @customers = CustomerInfo.all
  end



  def destroy
    @customer.destroy
    redirect_to customers_path, notice: "Customer deleted successfully."
  end

  private

  def set_customer
    @customer = CustomerInfo.find(params[:id])
  end
end
