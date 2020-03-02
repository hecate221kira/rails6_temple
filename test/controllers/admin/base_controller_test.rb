require 'test_helper'

class Admin::BaseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_base_index_url
    assert_response :success
  end

end
