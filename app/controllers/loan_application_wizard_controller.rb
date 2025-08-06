class LoanApplicationWizardController < ApplicationController
  include Wicked::Wizard
  before_action :set_loan_application

  steps :customer_info, :loan_detail

  def show
    case step
    when :customer_info
      @form = @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
    end

    render_wizard
  end

  def update
    case step
    when :customer_info
      @form = @loan_application.customer_info || @loan_application.build_customer_info
      if @form.update(customer_info_params)
        redirect_to next_wizard_path
      else
        render_wizard
      end
    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
      if @form.update(loan_detail_params)
        redirect_to next_wizard_path
      else
        render_wizard
      end
    end
  end

  private

  def set_loan_application
    @loan_application = LoanApplication.find(params[:loan_application_id])
  end

  def customer_info_params
    params.require(:customer_info).permit(:full_name, :contact, :id_number, :employment_status, :employer, :income, :expenses)
  end

  def loan_detail_params
    params.require(:loan_detail).permit(:amount, :duration, :purpose)
  end
end
