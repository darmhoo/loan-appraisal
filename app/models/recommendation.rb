class Recommendation < ApplicationRecord
  belongs_to :loan_application

  validates :decision, :suggested_loan_amount, :interest_rate, :terms, :disbursement_conditions, presence: true
end
