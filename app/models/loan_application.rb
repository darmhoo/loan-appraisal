class LoanApplication < ApplicationRecord
  belongs_to :user

  has_one :customer_info
  has_one :loan_detail
end
