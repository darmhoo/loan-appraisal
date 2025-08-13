class CreateCustomers < ActiveRecord::Migration[8.0]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :contact
      t.string :id_number
      t.string :employment_status
      t.string :employer
      t.decimal :income
      t.decimal :expenses

      t.timestamps
    end
  end
end
