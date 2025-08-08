class LoanApplicationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @loan_applications = current_user.loan_applications.includes(
      :customer_info, 
      :loan_detail,
      :financial_analysis,
      :credit_history
      )
  end

  # Start a loan application by creating a record only when first form is submitted
  def start
    redirect_to loan_application_wizard_path(:customer_info)
  end
end
