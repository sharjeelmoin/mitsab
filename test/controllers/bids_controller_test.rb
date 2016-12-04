require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bids_create_url
    assert_response :success
  end

  test "should get update" do
    get bids_update_url
    assert_response :success
  end

end
