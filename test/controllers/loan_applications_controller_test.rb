require "test_helper"

class LoanApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loan_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get loan_applications_show_url
    assert_response :success
  end

  test "should get destroy" do
    get loan_applications_destroy_url
    assert_response :success
  end
end
