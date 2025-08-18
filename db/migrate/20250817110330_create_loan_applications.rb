class CreateLoanApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :full_name
      t.text :contact_details
      t.string :identification
      t.string :employment_status
      t.string :employer
      t.decimal :monthly_income
      t.decimal :monthly_expenses
      t.decimal :loan_amount
      t.text :purpose
      t.integer :tenure
      t.string :repayment_frequency
      t.decimal :debt_to_income_ratio
      t.text :existing_loans
      t.decimal :savings
      t.text :assets
      t.integer :credit_score
      t.text :past_behavior
      t.text :defaults_late_payments
      t.string :collateral_type
      t.decimal :collateral_valuation
      t.text :ownership_documents
      t.string :borrower_risk_profile
      t.decimal :loan_to_value_ratio
      t.text :market_conditions
      t.string :recommendation_status
      t.decimal :suggested_amount
      t.decimal :interest_rate
      t.text :terms
      t.text :conditions
      t.string :current_step
      t.boolean :completed

      t.timestamps
    end
  end
end
