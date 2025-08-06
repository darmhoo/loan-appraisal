class DropCustomerInfosTable < ActiveRecord::Migration[7.0] # or [8.0] depending on your Rails version
  def up
    drop_table :customer_infos
  end

  def down
    create_table :customer_infos do |t|
      t.string :full_name
      t.string :contact
      t.string :identication
      t.string :employment
      t.string :employer
      t.decimal :income
      t.decimal :expenses
      t.timestamps
    end
  end
end
