class AddLtvRiskLevelToLoanApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :ltv_risk_level, :string
  end
end
