class CreateCustomerInfos < ActiveRecord::Migration[8.0]
  def change
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
