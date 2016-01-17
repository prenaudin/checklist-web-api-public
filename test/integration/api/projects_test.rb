require 'test_helper'

class ApiProjectsTest < ActionDispatch::IntegrationTest

  test "GET /api/projects List projects" do
    get "/api/projects", {}, user_authentication_headers(users(:pierre))
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 'Sample Project', response_json['data'][0]['title']
  end

  test "GET /api/projects/:id Show project" do
    get "/api/projects/#{projects(:sample).id}", {}, user_authentication_headers(users(:pierre))
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 'Sample Project', response_json['data']['title']
  end

  test "POST /api/projects Create project" do
    post "/api/projects", { data: { title: 'New Project'} }, user_authentication_headers(users(:pierre))
    assert_response :success
    response_json = JSON.parse(response.body)
    assert_equal 'New Project', response_json['data']['title']
  end

  test "DELETE /api/projects/:id Delete project" do
    delete "/api/projects/#{projects(:sample).id}", {}, user_authentication_headers(users(:pierre))
    assert_response :success
  end
end
