class CreditHistory < ApplicationRecord
  belongs_to :loan_application

  validates :credit_score, :existing_loans, :past_loan_repayment_behavior, :defaults_or_late_payments, presence: true

end
