require 'test_helper'

class ResponsibilityTransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @responsibility_transfer = responsibility_transfers(:one)
  end

  test "should get index" do
    get responsibility_transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_responsibility_transfer_url
    assert_response :success
  end

  test "should create responsibility_transfer" do
    assert_difference('ResponsibilityTransfer.count') do
      post responsibility_transfers_url, params: { responsibility_transfer: { inheritor_email: @responsibility_transfer.inheritor_email, inheritor_id: @responsibility_transfer.inheritor_id, transferable_id: @responsibility_transfer.transferable_id, transmitter_id: @responsibility_transfer.transmitter_id } }
    end

    assert_redirected_to responsibility_transfer_url(ResponsibilityTransfer.last)
  end

  test "should show responsibility_transfer" do
    get responsibility_transfer_url(@responsibility_transfer)
    assert_response :success
  end

  test "should get edit" do
    get edit_responsibility_transfer_url(@responsibility_transfer)
    assert_response :success
  end

  test "should update responsibility_transfer" do
    patch responsibility_transfer_url(@responsibility_transfer), params: { responsibility_transfer: { inheritor_email: @responsibility_transfer.inheritor_email, inheritor_id: @responsibility_transfer.inheritor_id, transferable_id: @responsibility_transfer.transferable_id, transmitter_id: @responsibility_transfer.transmitter_id } }
    assert_redirected_to responsibility_transfer_url(@responsibility_transfer)
  end

  test "should destroy responsibility_transfer" do
    assert_difference('ResponsibilityTransfer.count', -1) do
      delete responsibility_transfer_url(@responsibility_transfer)
    end

    assert_redirected_to responsibility_transfers_url
  end
end
