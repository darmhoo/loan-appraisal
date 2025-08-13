class Customer < ApplicationRecord
  has_many :loan_applications, dependent: :destroy
end
