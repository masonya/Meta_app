require "application_system_test_case"

class AccountTransfersTest < ApplicationSystemTestCase
  setup do
    @account_transfer = account_transfers(:one)
  end

  test "visiting the index" do
    visit account_transfers_url
    assert_selector "h1", text: "Account Transfers"
  end

  test "creating a Account transfer" do
    visit account_transfers_url
    click_on "New Account Transfer"

    click_on "Create Account transfer"

    assert_text "Account transfer was successfully created"
    click_on "Back"
  end

  test "updating a Account transfer" do
    visit account_transfers_url
    click_on "Edit", match: :first

    click_on "Update Account transfer"

    assert_text "Account transfer was successfully updated"
    click_on "Back"
  end

  test "destroying a Account transfer" do
    visit account_transfers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Account transfer was successfully destroyed"
  end
end
