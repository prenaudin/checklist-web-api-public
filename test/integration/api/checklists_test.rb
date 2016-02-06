require 'test_helper'

class ApiProjectsTest < ActionDispatch::IntegrationTest

  test "GET /api/projects/:id/checklists List checklists" do
    get "/api/projects", {}, user_authentication_headers(users(:pierre))
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 'Sample Project', response_json['data'][0]['title']
  end
end
