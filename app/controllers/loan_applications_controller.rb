  class LoanApplicationsController < ApplicationController
    before_action :authenticate_user!

    def index
      @loan_applications = LoanApplication.includes(:customer_info).all
    end

    # def start
    #   @loan_application = current_user.loan_applications.create!
    #   redirect_to loan_application_loan_application_wizard_path(@loan_application, :customer_info)
    # end

    def start
      redirect_to loan_application_loan_application_wizard_path("new", :customer_info)
    end




    def destroy
      @loan_application = LoanApplication.find(params[:id])
      @loan_application.destroy
      redirect_to loan_applications_path, notice: "Customer deleted successfully."
    end
  end
