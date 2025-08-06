require "application_system_test_case"

class CustomerInfosTest < ApplicationSystemTestCase
  setup do
    @customer_info = customer_infos(:one)
  end

  test "visiting the index" do
    visit customer_infos_url
    assert_selector "h1", text: "Customer infos"
  end

  test "should create customer info" do
    visit customer_infos_url
    click_on "New customer info"

    fill_in "Contact", with: @customer_info.contact
    fill_in "Employer", with: @customer_info.employer
    fill_in "Employment", with: @customer_info.employment
    fill_in "Expenses", with: @customer_info.expenses
    fill_in "Full name", with: @customer_info.full_name
    fill_in "Identication", with: @customer_info.identication
    fill_in "Income", with: @customer_info.income
    click_on "Create Customer info"

    assert_text "Customer info was successfully created"
    click_on "Back"
  end

  test "should update Customer info" do
    visit customer_info_url(@customer_info)
    click_on "Edit this customer info", match: :first

    fill_in "Contact", with: @customer_info.contact
    fill_in "Employer", with: @customer_info.employer
    fill_in "Employment", with: @customer_info.employment
    fill_in "Expenses", with: @customer_info.expenses
    fill_in "Full name", with: @customer_info.full_name
    fill_in "Identication", with: @customer_info.identication
    fill_in "Income", with: @customer_info.income
    click_on "Update Customer info"

    assert_text "Customer info was successfully updated"
    click_on "Back"
  end

  test "should destroy Customer info" do
    visit customer_info_url(@customer_info)
    accept_confirm { click_on "Destroy this customer info", match: :first }

    assert_text "Customer info was successfully destroyed"
  end
end
