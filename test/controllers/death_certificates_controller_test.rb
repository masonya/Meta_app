require 'test_helper'

class DeathCertificatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @death_certificate = death_certificates(:one)
  end

  test "should get index" do
    get death_certificates_url
    assert_response :success
  end

  test "should get new" do
    get new_death_certificate_url
    assert_response :success
  end

  test "should create death_certificate" do
    assert_difference('DeathCertificate.count') do
      post death_certificates_url, params: { death_certificate: {  } }
    end

    assert_redirected_to death_certificate_url(DeathCertificate.last)
  end

  test "should show death_certificate" do
    get death_certificate_url(@death_certificate)
    assert_response :success
  end

  test "should get edit" do
    get edit_death_certificate_url(@death_certificate)
    assert_response :success
  end

  test "should update death_certificate" do
    patch death_certificate_url(@death_certificate), params: { death_certificate: {  } }
    assert_redirected_to death_certificate_url(@death_certificate)
  end

  test "should destroy death_certificate" do
    assert_difference('DeathCertificate.count', -1) do
      delete death_certificate_url(@death_certificate)
    end

    assert_redirected_to death_certificates_url
  end
end
