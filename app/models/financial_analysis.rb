class FinancialAnalysis < ApplicationRecord
  belongs_to :loan_application

  validates :income_vs_expenses, :debt_to_income_ratio, :existing_loans, :savings_assets, presence: true
end
