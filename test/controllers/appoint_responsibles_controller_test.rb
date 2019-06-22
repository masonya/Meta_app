require 'test_helper'

class AppointResponsiblesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appoint_responsible = appoint_responsibles(:one)
  end

  test "should get index" do
    get appoint_responsibles_url
    assert_response :success
  end

  test "should get new" do
    get new_appoint_responsible_url
    assert_response :success
  end

  test "should create appoint_responsible" do
    assert_difference('AppointResponsible.count') do
      post appoint_responsibles_url, params: { appoint_responsible: { email: @appoint_responsible.email, user_id: @appoint_responsible.user_id } }
    end

    assert_redirected_to appoint_responsible_url(AppointResponsible.last)
  end

  test "should show appoint_responsible" do
    get appoint_responsible_url(@appoint_responsible)
    assert_response :success
  end

  test "should get edit" do
    get edit_appoint_responsible_url(@appoint_responsible)
    assert_response :success
  end

  test "should update appoint_responsible" do
    patch appoint_responsible_url(@appoint_responsible), params: { appoint_responsible: { email: @appoint_responsible.email, user_id: @appoint_responsible.user_id } }
    assert_redirected_to appoint_responsible_url(@appoint_responsible)
  end

  test "should destroy appoint_responsible" do
    assert_difference('AppointResponsible.count', -1) do
      delete appoint_responsible_url(@appoint_responsible)
    end

    assert_redirected_to appoint_responsibles_url
  end
end
