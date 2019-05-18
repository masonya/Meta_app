require "application_system_test_case"

class ResponsibilityTransfersTest < ApplicationSystemTestCase
  setup do
    @responsibility_transfer = responsibility_transfers(:one)
  end

  test "visiting the index" do
    visit responsibility_transfers_url
    assert_selector "h1", text: "Responsibility Transfers"
  end

  test "creating a Responsibility transfer" do
    visit responsibility_transfers_url
    click_on "New Responsibility Transfer"

    fill_in "Inheritor Email", with: @responsibility_transfer.inheritor_email
    fill_in "Inheritor", with: @responsibility_transfer.inheritor_id
    fill_in "Transferable", with: @responsibility_transfer.transferable_id
    fill_in "Transmitter", with: @responsibility_transfer.transmitter_id
    click_on "Create Responsibility transfer"

    assert_text "Responsibility transfer was successfully created"
    click_on "Back"
  end

  test "updating a Responsibility transfer" do
    visit responsibility_transfers_url
    click_on "Edit", match: :first

    fill_in "Inheritor Email", with: @responsibility_transfer.inheritor_email
    fill_in "Inheritor", with: @responsibility_transfer.inheritor_id
    fill_in "Transferable", with: @responsibility_transfer.transferable_id
    fill_in "Transmitter", with: @responsibility_transfer.transmitter_id
    click_on "Update Responsibility transfer"

    assert_text "Responsibility transfer was successfully updated"
    click_on "Back"
  end

  test "destroying a Responsibility transfer" do
    visit responsibility_transfers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Responsibility transfer was successfully destroyed"
  end
end
