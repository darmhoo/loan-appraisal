class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # ---- Summary Counts ----
    @total_applications      = LoanApplication.count
    @completed_applications  = LoanApplication.where(completed: true).count
    @in_progress_applications = LoanApplication.where(completed: [false, nil]).count

    @approved_applications   = LoanApplication.where(recommendation_status: "Approved").count
    @rejected_applications   = LoanApplication.where(recommendation_status: "Rejected").count
    @pending_applications    = LoanApplication.where(recommendation_status: "Pending").count

    # ---- Chart Data ----
    date_range = Date.new(Date.today.year, 1, 1)..Date.today

    @loan_trends = LoanApplication.group_by_month(:created_at, range: date_range, format: "%b").count

    @approved_over_time = LoanApplication.where(recommendation_status: "Approved")
                                         .group_by_month(:created_at, range: date_range, format: "%b")
                                         .count

    @rejected_over_time = LoanApplication.where(recommendation_status: "Rejected")
                                         .group_by_month(:created_at, range: date_range, format: "%b")
                                         .count

    @pending_over_time = LoanApplication.where(recommendation_status: "Pending")
                                        .group_by_month(:created_at, range: date_range, format: "%b")
                                        .count
  end
end
