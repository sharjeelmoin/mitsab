require 'test_helper'

class LotsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lots_show_url
    assert_response :success
  end

end
