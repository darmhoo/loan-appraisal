class LoanApplicationsController < ApplicationController
  def start
    loan_app = current_user.loan_applications.create!(status: "in_progress")
    redirect_to loan_application_wizard_path(loan_app, :customer_info)
  end
end
