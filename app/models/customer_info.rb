class CustomerInfo < ApplicationRecord
  belongs_to :loan_application

  validates :full_name, :contact, :id_number, :employment_status, :employer, :income, :expenses, presence: true

end
