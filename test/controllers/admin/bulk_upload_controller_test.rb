require 'test_helper'

class Admin::BulkUploadControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_bulk_upload_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_bulk_upload_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_bulk_upload_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_bulk_upload_destroy_url
    assert_response :success
  end

end
