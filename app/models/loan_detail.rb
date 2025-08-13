class LoanDetail < ApplicationRecord
  belongs_to :loan_application

  validates :loan_amount, :loan_purpose, :loan_tenure, :repayment_frequency, presence: true
end
