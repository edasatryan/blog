require 'test_helper'

class Api::V1::CommentsApiControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_comments_api_create_url
    assert_response :success
  end

end
