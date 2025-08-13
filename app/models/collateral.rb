class Collateral < ApplicationRecord
  belongs_to :loan_application

  validates :collateral_type, :valuation, :ownership_documents, presence: true
end
