class LoanApplicationWizardController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :set_loan_application, only: [:show, :update]

  steps :customer_info, :loan_detail, :financial_analysis, :credit_history

  def show
    case step
    when :customer_info
      @customer_info = @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @loan_detail = @loan_application.loan_detail || @loan_application.build_loan_detail
    when :financial_analysis
      @financial_analysis = @loan_application.financial_analysis || @loan_application.build_financial_analysis
    when :credit_history
      @credit_history = @loan_application.credit_history || @loan_application.build_credit_history
    end
    render_wizard
  end

  def update
    case step
    when :customer_info
      @customer_info = @loan_application.customer_info || @loan_application.build_customer_info
      if @customer_info.update(customer_info_params)
        render_wizard @loan_application
      else
        render step
      end
    when :loan_detail
      @loan_detail = @loan_application.loan_detail || @loan_application.build_loan_detail
      if @loan_detail.update(loan_detail_params)
        @loan_application.update(status: "submitted")
        render_wizard @loan_application
      else
        render step
      end
    when :financial_analysis
      @financial_analysis = @loan_application.financial_analysis || @loan_application.build_financial_analysis
      if @financial_analysis.update(financial_analysis_params)
        @loan_application.update(status: "submitted")
        render_wizard @loan_application
      else
        render step
      end
    when :credit_history
      @credit_history = @loan_application.credit_history || @loan_application.build_credit_history
      if @credit_history.update(credit_history_params)
        @loan_application.update(status: "submitted")
        render_wizard @loan_application
      else
        render step
      end
    end
  end

  private

  # Only create a LoanApplication record once at first step
  def set_loan_application
    if params[:loan_application_id]
      @loan_application = current_user.loan_applications.find(params[:loan_application_id])
    else
      @loan_application = current_user.loan_applications.create!(status: "draft")
    end
  end

  def customer_info_params
    params.require(:customer_info).permit(:full_name, :contact, :id_number, :employment_status, :employer, :income, :expenses)
  end

  def loan_detail_params
    params.require(:loan_detail).permit(:loan_amount, :loan_purpose, :loan_tenure, :repayment_frequency)
  end
 
  def financial_analysis_params
    params.require(:financial_analysis).permit(:income_vs_expenses, :debt_to_income_ratio, :existing_loans, :savings_assets)
  end
  def credit_history_params
    params.require(:credit_history).permit(:credit_score, :past_loan_repayment_behavior, :defaults_or_late_payments)
  end
end
