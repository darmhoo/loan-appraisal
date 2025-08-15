class AddCustomerIdToLoanApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :loan_applications, :customer_id, :bigint
  end
end
