class LoanApplicationWizardController < ApplicationController
  include Wicked::Wizard
  before_action :authenticate_user!
  before_action :set_loan_application, only: [:show, :update]

  STEPS = [:customer_info, :loan_detail, :financial_analysis, :credit_history, :collateral, :risk_assessment, :recommendation]
  steps *STEPS



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
    when :collateral
      @collateral = @loan_application.collateral || @loan_application.build_collateral
    when :risk_assessment
      @risk_assessment = @loan_application.risk_assessment || @loan_application.build_risk_assessment
    when :recommendation
      @recommendation = @loan_application.recommendation || @loan_application.build_recommendation
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
    when :collateral
      @collateral = @loan_application.collateral || @loan_application.build_collateral
      if @collateral.update(collateral_params)
        @loan_application.update(status: "submitted")
        render_wizard @loan_application
      else
        render step
      end
    when :risk_assessment
      @risk_assessment = @loan_application.risk_assessment || @loan_application.build_risk_assessment
      if @risk_assessment.update(risk_assessment_params)  
        @loan_application.update(status: "submitted")
        render_wizard @loan_application
      else
        render step
      end
    when :recommendation
      @recommendation = @loan_application.recommendation || @loan_application.build_recommendation
      if @recommendation.update(recommendation_params)
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
    @loan_application = LoanApplication.find(params[:loan_application_id])
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
  def collateral_params
    params.require(:collateral).permit(:collateral_type, :valuation, :ownership_documents)
  end
  def risk_assessment_params
    params.require(:risk_assessment).permit(:risk_profile, :loan_to_value_ratio, :market_conditions)
  end
  def recommendation_params
    params.require(:recommendation).permit(:decision, :suggested_loan_amount, :interest_rate, :terms, :disbursement_conditions)
  end
end
