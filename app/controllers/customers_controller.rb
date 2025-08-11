class CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:destroy]


  def index
    @customers = CustomerInfo.all
    respond_to do |format|
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="customers.xlsx"'
      }
      format.html {render :index}
    end
  end

  def show
    @customer = CustomerInfo.find(params[:id])
    @loan_application = @customer.loan_application
    @loan_detail = @loan_application.loan_detail
    @financial_analysis = @loan_application.financial_analysis
    @risk_assessment = @loan_application.risk_assessment
    @recommendation = @loan_application.recommendation
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
