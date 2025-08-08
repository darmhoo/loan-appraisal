class LoanApplicationWizardController < ApplicationController
  include Wicked::Wizard
  before_action :set_loan_application

  steps :customer_info, :loan_detail

  def show
    case step
    when :customer_info
      @form = @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
    end

    render_wizard
  end

  def update
    case step
    when :customer_info
      # Ensure loan_application is saved first
      if @loan_application.new_record?
        @loan_application.save!
      end

      @form = @loan_application.customer_info || @loan_application.build_customer_info
      if @form.update(form_params)
        render_wizard(@loan_application, notice: "Customer information saved successfully.")
      else
        render_wizard
      end

    when :loan_detail
      @form = @loan_application.loan_detail || @loan_application.build_loan_detail
      if @form.update(form_params)
        render_wizard(@loan_application, notice: "Loan details saved successfully.")
      else
        render_wizard
      end
    end
  end

  def finish_wizard_path
    loan_applications_path
  end



  private

  def set_loan_application
    if params[:loan_application_id] == "new"
      @loan_application = current_user.loan_applications.build
    else
      @loan_application = LoanApplication.find(params[:loan_application_id])
    end
  end


  def get_form_for_step
    case step
    when :customer_info
      @loan_application.customer_info || @loan_application.build_customer_info
    when :loan_detail
      @loan_application.loan_detail || @loan_application.build_loan_detail
    end
  end

  def form_params
    case step
    when :customer_info
      params.require(:customer_info).permit(:full_name, :contact, :id_number, :employment_status, :employer, :income, :expenses)
    when :loan_detail
      params.require(:loan_detail).permit(:loan_amount, :loan_tenure, :loan_purpose, :repayment_frequency)
    end
  end
end
