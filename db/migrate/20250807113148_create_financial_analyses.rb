class CreateFinancialAnalyses < ActiveRecord::Migration[8.0]
  def change
    create_table :financial_analyses do |t|
      t.string :income_vs_expenses
      t.string :debt_to_income_ratio
      t.string :existing_loans
      t.string :savings_assets
      t.belongs_to :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
