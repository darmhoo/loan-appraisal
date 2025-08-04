class LoanApplicationWizardController < ApplicationController
  include Wicked::Wizard
  before_action :set_loan_application

  steps :customer_info, :loan_detail, :financial_analysis, :credit_history, :collateral_info, :risk_assessment, :loan_recommendation

  def show
    case step
    when :customer_info
      @form = @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
    when :financial_analysis
      @form = @loan_application.financial_analysis || @loan_application.build_financial_analysis
    when :credit_history
      @form = @loan_application.credit_history || @loan_application.build_credit_history
    when :collateral_info
      @form = @loan_application.collateral_info || @loan_application.build_collateral_info
    when :risk_assessment
      @form = @loan_application.risk_assessment || @loan_application.build_risk_assessment
    when :loan_recommendation
      @form = @loan_application.loan_recommendation || @loan_application.build_loan_recommendation
    end

    render_wizard
  end

  def update
    case step
    when :customer_info
      @form = @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
    when :financial_analysis
      @form = @loan_application.financial_analysis || @loan_application.build_financial_analysis
    when :credit_history
      @form = @loan_application.credit_history || @loan_application.build_credit_history
    when :collateral_info
      @form = @loan_application.collateral_info || @loan_application.build_collateral_info
    when :risk_assessment
      @form = @loan_application.risk_assessment || @loan_application.build_risk_assessment
    when :loan_recommendation
      @form = @loan_application.loan_recommendation || @loan_application.build_loan_recommendation
    end

    if @form.update(form_params(step))
      update_loan_status
      render_wizard @loan_application
    else
      render step
    end
  end

  private

  def update_loan_status!
    completed = %i[
      customer_info loan_detail financial_analysis
      credit_history collateral_info risk_assessment
      loan_recommendation
    ].all? do |step|
      @loan_application.send(step).present?
    end

    @loan_application.update!(status: completed ? "completed" : "in_progress")
  end

  def set_loan_application
    @loan_application = LoanApplication.find(params[:loan_application_id])
  end

  def form_params(step)
    case step
    when :customer_info
      params.require(:customer_info).permit(:full_name, :contact, :id_number, :employment_status, :employer, :income, :expenses)
    when "loan_detail"
      params.require(:loan_detail).permit(:loan_amount, :loan_purpose, :loan_tenure, :repayment_frequency)
    when "financial_analysis"
      params.require(:financial_analysis).permit(:income_vs_expenses, :debt_to_income, :existing_loans, :savings)
    when "credit_history"
      params.require(:credit_history).permit(:credit_score, :past_behavior, :defaults)
    when "collateral_info"
      params.require(:collateral_info).permit(:collateral_type, :collateral_value, :ownership_docs)
    when "risk_assessment"
      params.require(:risk_assessment).permit(:risk_profile, :loan_to_value, :market_conditions)
    when "loan_recommendation"
      params.require(:loan_recommendation).permit(:recommendation, :suggested_amount, :interest_rate, :conditions)
    end
  end
end
