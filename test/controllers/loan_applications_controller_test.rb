require "test_helper"

class LoanApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loan_applications_index_url
    assert_response :success
  end
end
