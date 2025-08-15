class CreateLoanApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :loan_applications do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
