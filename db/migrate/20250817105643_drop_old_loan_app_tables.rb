class DropOldLoanAppTables < ActiveRecord::Migration[8.0]
  def change
    drop_table :collaterals
    drop_table :credit_histories
    drop_table :customer_infos
    drop_table :customers
    drop_table :financial_analyses
    drop_table :loan_details
    drop_table :recommendations
    drop_table :risk_assessments
    drop_table :loan_applications
  end
end
