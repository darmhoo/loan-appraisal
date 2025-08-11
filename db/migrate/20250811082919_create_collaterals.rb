class CreateCollaterals < ActiveRecord::Migration[8.0]
  def change
    create_table :collaterals do |t|
      t.string :collateral_type
      t.decimal :valuation
      t.text :ownership_documents
      t.references :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
