class LoanApplication < ApplicationRecord
  belongs_to :user

  has_one :customer_info, dependent: :destroy
  has_one :loan_detail, dependent: :destroy
  has_one :financial_analysis, dependent: :destroy
  has_one :credit_history, dependent: :destroy
  has_one :collateral, dependent: :destroy
  has_one :risk_assessment, dependent: :destroy
  has_one :recommendation, dependent: :destroy

  STEPS = [:customer_info, :loan_detail, :financial_analysis, :credit_history, :collateral, :risk_assessment, :recommendation]

  def next_incomplete_step
    STEPS.find do |step|
      case step
      when :customer_info
        customer_info.nil? || !customer_info.valid?
      when :loan_detail
        loan_detail.nil? || !loan_detail.valid?
      when :financial_analysis
        financial_analysis.nil? || !financial_analysis.valid?
      when :credit_history
        credit_history.nil? || !credit_history.valid?
      when :collateral
        collateral.nil? || !collateral.valid?
      when :risk_assessment
        risk_assessment.nil? || !risk_assessment.valid?
      when :recommendation
        recommendation.nil? || !recommendation.valid?
      end
    end || :customer_info
  end

end
