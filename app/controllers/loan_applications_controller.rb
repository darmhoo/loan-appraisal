class LoanApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan_application, only: [:destroy]

  def index
    @loan_applications = current_user.loan_applications.includes(
      :customer_info, 
      :loan_detail,
      :financial_analysis,
      :credit_history,
      :collateral,
      :risk_assessment,
      :recommendation
      )
  end

  def destroy
    @loan_application.destroy
    redirect_to loan_applications_path, notice: "Loan application deleted successfully."
  end

  # Start a loan application by creating a record only when first form is submitted
  def start
    redirect_to loan_application_wizard_path(:customer_info)
  end

  def wizard
    @loan_application = LoanApplication.find(params[:id])
    @step = params[:step] # Use this to render specific steps in the wizard
  end

  private

  def set_loan_application
    @loan_application = LoanApplication.find(params[:id])
  end
end
