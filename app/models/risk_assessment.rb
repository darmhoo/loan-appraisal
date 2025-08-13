class RiskAssessment < ApplicationRecord
  belongs_to :loan_application

  validates :risk_profile, :loan_to_value_ratio, :market_conditions, presence: true
end
