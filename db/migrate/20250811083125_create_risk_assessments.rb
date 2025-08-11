class CreateRiskAssessments < ActiveRecord::Migration[8.0]
  def change
    create_table :risk_assessments do |t|
      t.string :risk_profile
      t.decimal :loan_to_value_ratio
      t.text :market_conditions
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
