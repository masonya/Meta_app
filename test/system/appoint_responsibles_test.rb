require "application_system_test_case"

class AppointResponsiblesTest < ApplicationSystemTestCase
  setup do
    @appoint_responsible = appoint_responsibles(:one)
  end

  test "visiting the index" do
    visit appoint_responsibles_url
    assert_selector "h1", text: "Appoint Responsibles"
  end

  test "creating a Appoint responsible" do
    visit appoint_responsibles_url
    click_on "New Appoint Responsible"

    fill_in "Email", with: @appoint_responsible.email
    fill_in "User", with: @appoint_responsible.user_id
    click_on "Create Appoint responsible"

    assert_text "Appoint responsible was successfully created"
    click_on "Back"
  end

  test "updating a Appoint responsible" do
    visit appoint_responsibles_url
    click_on "Edit", match: :first

    fill_in "Email", with: @appoint_responsible.email
    fill_in "User", with: @appoint_responsible.user_id
    click_on "Update Appoint responsible"

    assert_text "Appoint responsible was successfully updated"
    click_on "Back"
  end

  test "destroying a Appoint responsible" do
    visit appoint_responsibles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appoint responsible was successfully destroyed"
  end
end
