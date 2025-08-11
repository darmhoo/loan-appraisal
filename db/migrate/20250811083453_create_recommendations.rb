class CreateRecommendations < ActiveRecord::Migration[8.0]
  def change
    create_table :recommendations do |t|
      t.string :decision
      t.decimal :suggested_loan_amount
      t.decimal :interest_rate
      t.text :terms
      t.text :disbursement_conditions
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
