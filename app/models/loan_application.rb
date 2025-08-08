class LoanApplication < ApplicationRecord
  belongs_to :user

  has_one :customer_info, dependent: :destroy
  has_one :loan_detail, dependent: :destroy
  has_one :financial_analysis, dependent: :destroy
  

  def completed?
    customer_info&.persisted? &&
    (defined?(LoanDetail) && loan_detail&.persisted?) &&
    (defined?(FinancialAnalysis) && financial_analysis&.persisted?) &&
    (defined?(CreditHistory) && credit_history&.persisted?) &&
    (defined?(CollateralInfo) && collateral_info&.persisted?) &&
    (defined?(RiskAssessment) && risk_assessment&.persisted?) &&
    (defined?(LoanRecommendation) && loan_recommendation&.persisted?)
  end

  def next_incomplete_step
    return :customer_info unless customer_info.present?
    return :loan_detail unless loan_detail.present?
    return :financial_analysis unless financial_analysis.present?
    return :credit_history unless credit_history.present?
    return :collateral_info unless collateral_info.present?
    return :risk_assessment unless risk_assessment.present?
    return :loan_recommendation unless loan_recommendation.present?
    :loan_recommendation
  end


  

end
