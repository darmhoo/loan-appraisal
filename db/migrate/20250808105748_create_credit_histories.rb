class CreateCreditHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :credit_histories do |t|
      t.integer :credit_score
      t.text :past_loan_repayment_behavior
      t.text :defaults_or_late_payments
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
