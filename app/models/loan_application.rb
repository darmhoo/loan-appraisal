class LoanApplication < ApplicationRecord
  belongs_to :user
  before_save :set_loan_to_value_ratio_and_risk


  # Step 1 validations
  validates :full_name, presence: true, if: :step_1_or_later?
  validates :contact_details, presence: true, if: :step_1_or_later?
  validates :identification, presence: true, if: :step_1_or_later?
  validates :employment_status, presence: true, if: :step_1_or_later?
  validates :employer, presence: true, if: :step_1_or_later?
  validates :monthly_income, presence: true, if: :step_1_or_later?
  validates :monthly_expenses, presence: true, if: :step_1_or_later?

  # Step 2 validations
  validates :loan_amount, presence: true, numericality: { greater_than: 0 }, if: :step_2_or_later?
  validates :purpose, presence: true, if: :step_2_or_later?
  validates :tenure, presence: true, if: :step_2_or_later?
  validates :repayment_frequency, presence: true, if: :step_2_or_later?

  # Step 3 validations
  validates :debt_to_income_ratio, presence: true, if: :step_3_or_later?
  validates :existing_loans, presence: true, if: :step_3_or_later?
  validates :savings, presence: true, if: :step_3_or_later?
  validates :assets, presence: true, if: :step_3_or_later?

  # Step 4 validations
  validates :credit_score, presence: true, if: :step_4_or_later?
  validates :past_behavior, presence: true, if: :step_4_or_later?
  validates :defaults_late_payments, presence: true, if: :step_4_or_later?

  # Step 5 validations
  validates :collateral_type, presence: true, if: :step_5_or_later?
  validates :collateral_valuation, presence: true, if: :step_5_or_later?
  validates :ownership_documents, presence: true, if: :step_5_or_later?



  # Step 6 validations
  validates :borrower_risk_profile, presence: true, if: :step_6_or_later?
  validates :loan_to_value_ratio, presence: true, if: :step_6_or_later?
  validates :market_conditions, presence: true, if: :step_6_or_later?


  # Step 7 validations
  validates :recommendation_status, presence: true, if: :step_7_or_later?
  validates :suggested_amount, presence: true, if: :step_7_or_later?
  validates :interest_rate, presence: true, if: :step_7_or_later?


  # Calculate Loan-to-Value ratio
  def calculate_ltv
    return nil if loan_amount.blank? || collateral_valuation.blank? || collateral_valuation.to_f.zero?
    (loan_amount.to_f / collateral_valuation.to_f * 100).round(2)
  end

  # Determine risk level from LTV
  def calculate_ltv_risk
      ltv = calculate_ltv
      return nil if ltv.nil?

      if ltv > 80
        "High Risk"
      else
        "Acceptable Risk"
      end
  end
 

  def next_step
    steps = %w[customer_info loan_details financial_analysis credit_history collateral risk_assessment recommendation]
    current_index = steps.index(current_step) || 0
    steps[current_index + 1] || 'wicked_finish'
  end

  def completed_steps
    steps = []
    steps << 'customer_info' if full_name.present?
    steps << 'loan_details' if loan_amount.present?
    steps << 'financial_analysis' if debt_to_income_ratio.present?
    steps << 'credit_history' if credit_score.present?
    steps << 'collateral' if collateral_type.present?
    steps << 'risk_assessment' if borrower_risk_profile.present?
    steps << 'recommendation' if recommendation_status.present?
    steps
  end

  def step_number(step_name)
    steps = %w[customer_info loan_details financial_analysis credit_history collateral risk_assessment recommendation]
    steps.index(step_name.to_s) + 1 rescue 1
  end

  private

  def set_loan_to_value_ratio_and_risk
    if loan_amount.present? && collateral_valuation.present?
      self.loan_to_value_ratio = calculate_ltv
      self.ltv_risk_level = calculate_ltv_risk
    end
  end

  def step_1_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 1
  end

  def step_2_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 2
  end

  def step_3_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 3
  end

  def step_4_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 4
  end

  def step_5_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 5
  end

  def step_6_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 6
  end

  def step_7_or_later?
    return false if current_step.blank?
    step_number(current_step) >= 7
  end
end
