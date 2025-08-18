class LoanApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_loan_application, only: [:show, :destroy]

  def index
    @loan_applications = current_user.loan_applications.order(created_at: :desc)
  end

  def show
  end

  def new
    redirect_to loan_application_steps_path
  end



  def destroy
    @loan_application.destroy
    redirect_to loan_applications_path, notice: 'Loan application was successfully deleted.'
  end

  private

  def set_loan_application
    @loan_application = current_user.loan_applications.find(params[:id])
  end
end
