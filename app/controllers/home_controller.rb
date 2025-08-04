class HomeController < ApplicationController
  def index
    @customer_infos = CustomerInfo.includes(:loan_application).order(created_at: :desc)
  end

end
