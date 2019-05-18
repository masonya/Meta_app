require "application_system_test_case"

class DeathCertificatesTest < ApplicationSystemTestCase
  setup do
    @death_certificate = death_certificates(:one)
  end

  test "visiting the index" do
    visit death_certificates_url
    assert_selector "h1", text: "Death Certificates"
  end

  test "creating a Death certificate" do
    visit death_certificates_url
    click_on "New Death Certificate"

    click_on "Create Death certificate"

    assert_text "Death certificate was successfully created"
    click_on "Back"
  end

  test "updating a Death certificate" do
    visit death_certificates_url
    click_on "Edit", match: :first

    click_on "Update Death certificate"

    assert_text "Death certificate was successfully updated"
    click_on "Back"
  end

  test "destroying a Death certificate" do
    visit death_certificates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Death certificate was successfully destroyed"
  end
end
