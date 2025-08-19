class LoanApplicationStepsController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  
  steps :customer_info, :loan_details, :financial_analysis, :credit_history, :collateral, :risk_assessment, :recommendation

  # def show
  #   @loan_application = find_or_build_loan_application
  #   render_wizard
  # end
  
  def show
    @loan_application = find_or_build_loan_application

    if step == "recommendation"
      # Assign in memory for display
      @loan_application.loan_to_value_ratio ||= @loan_application.calculate_ltv
      @loan_application.ltv_risk_level      ||= @loan_application.calculate_ltv_risk
    end

    render_wizard
  end




  def index
    loan_application = current_user.loan_applications.build
    redirect_to loan_application_step_path(:customer_info, loan_application_id: 'new')
  end




  
  # def update
  #   @loan_application = find_or_build_loan_application
  #   @loan_application.assign_attributes(loan_application_params)
  #   @loan_application.current_step = step.to_s

  #   @loan_application.completed = true if step == :recommendation

  #   if @loan_application.save
  #     if params[:commit] == 'Save & Exit'
  #       redirect_to loan_applications_path, notice: 'Progress saved. You can resume later.'
  #     elsif step == :recommendation
  #       redirect_to loan_application_path(@loan_application), notice: 'Loan application completed successfully!'
  #     else
  #       redirect_to wizard_path(next_step, loan_application_id: @loan_application.id)
  #     end
  #   else
  #     render_wizard
  #   end
  # end
  

  def update
    @loan_application = find_or_build_loan_application
    @loan_application.assign_attributes(loan_application_params)
    @loan_application.current_step = step.to_s

    # Always calculate LTV and risk if collateral and loan amount are present
    if @loan_application.loan_amount.present? && @loan_application.collateral_valuation.present?
      @loan_application.loan_to_value_ratio ||= @loan_application.calculate_ltv
      @loan_application.ltv_risk_level      ||= @loan_application.calculate_ltv_risk
    end

    # Mark completed if we're on the last step
    @loan_application.completed = true if step == :recommendation

    if @loan_application.save
      if params[:commit] == 'Save & Exit'
        redirect_to loan_applications_path, notice: 'Progress saved. You can resume later.'
      elsif step == :recommendation
        redirect_to loan_application_path(@loan_application), notice: 'Loan application completed successfully!'
      else
        redirect_to wizard_path(next_step, loan_application_id: @loan_application.id)
      end
    else
      render_wizard
    end
  end




  private

  
  def find_or_build_loan_application
    if params[:loan_application_id].present?
      if params[:loan_application_id] == "new"
        current_user.loan_applications.build # only for very first entry
      else
        current_user.loan_applications.find(params[:loan_application_id])
      end
    else
      current_user.loan_applications.build
    end
  end





  def loan_application_params
    case step
    when :customer_info
      params.require(:loan_application).permit(:full_name, :contact_details, :identification, :employment_status, :employer, :monthly_income, :monthly_expenses)
    when :loan_details
      params.require(:loan_application).permit(:loan_amount, :purpose, :tenure, :repayment_frequency)
    when :financial_analysis
      params.require(:loan_application).permit(:debt_to_income_ratio, :existing_loans, :savings, :assets)
    when :credit_history
      params.require(:loan_application).permit(:credit_score, :past_behavior, :defaults_late_payments)
    when :collateral
      params.require(:loan_application).permit(:collateral_type, :collateral_valuation, :ownership_documents)
    when :risk_assessment
      params.require(:loan_application).permit(:borrower_risk_profile, :loan_to_value_ratio, :market_conditions)
    when :recommendation
      params.require(:loan_application).permit(:recommendation_status, :suggested_amount, :interest_rate, :terms, :conditions)
    else
      {}
    end
  end
end
