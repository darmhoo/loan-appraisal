class LoanApplication < ApplicationRecord
  belongs_to :user

  has_one :customer_info, dependent: :destroy
  # has_one :loan_detail, dependent: :destroy

  def completed?
    customer_info&.persisted? &&
    (defined?(LoanDetail) && loan_detail&.persisted?) &&
    (defined?(FinancialAnalysis) && financial_analysis&.persisted?) &&
    (defined?(CreditHistory) && credit_history&.persisted?) &&
    (defined?(CollateralInfo) && collateral_info&.persisted?) &&
    (defined?(RiskAssessment) && risk_assessment&.persisted?) &&
    (defined?(LoanRecommendation) && loan_recommendation&.persisted?)
  end


  

end
