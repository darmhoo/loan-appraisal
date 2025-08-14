class CreateLoanDetails < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_details do |t|
      t.decimal :loan_amount
      t.string :loan_purpose
      t.string :loan_tenure
      t.string :repayment_frequency
      t.belongs_to :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
