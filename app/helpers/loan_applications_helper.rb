module LoanApplicationsHelper
  def next_incomplete_step(application)
    steps = %i[
      customer_info
      loan_detail 
      financial_analysis
      credit_history
      collateral_info
      risk_assessment
      loan_recommendation
    ]

    steps.detect { |step| application.send(step).blank? } || :loan_recommendation
  end
end
