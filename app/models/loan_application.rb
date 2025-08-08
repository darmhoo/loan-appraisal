class LoanApplication < ApplicationRecord
  belongs_to :user

  has_one :customer_info, dependent: :destroy
  has_one :loan_detail, dependent: :destroy
  has_one :financial_analysis, dependent: :destroy
  has_one :credit_history, dependent: :destroy

end
