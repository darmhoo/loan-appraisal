class CreateCustomerInfos < ActiveRecord::Migration[8.0]
  def change
    create_table :customer_infos do |t|
      t.string :full_name
      t.string :contact
      t.string :id_number
      t.string :employment_status
      t.string :employer
      t.decimal :income
      t.decimal :expenses
      t.belongs_to :loan_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
