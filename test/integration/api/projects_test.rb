require 'test_helper'

class ApiProjectsTest < ActionDispatch::IntegrationTest

  test "GET /api/projects List projects" do
    get "/api/projects", {}, user_authentication_headers(users(:pierre))
    assert_response :success
    assert be_jsonapi_response_for(response.body, 'project')
  end

  # test "GET /api/projects/:id Show project" do
  #   get "/api/projects/#{projects(:sample).id}", {}, user_authentication_headers(users(:pierre))
  #   assert_response :success
  #   response_json = JSON.parse(response.body)
  #   assert_equal 'Sample Project', response_json['data']['title']
  # end
  #
  # test "POST /api/projects Create project" do
  #   post "/api/projects", { data: { title: 'New Project'} }, user_authentication_headers(users(:pierre))
  #   assert_response :success
  #   response_json = JSON.parse(response.body)
  #   assert_equal 'New Project', response_json['data']['title']
  # end
  #
  # test "PUT /api/projects Update project" do
  #   put "/api/projects/#{projects(:sample).id}", { data: { title: 'Update Project'} }, user_authentication_headers(users(:pierre))
  #   assert_response :success
  #   response_json = JSON.parse(response.body)
  #   assert_equal 'Update Project', response_json['data']['title']
  # end
  #
  # test "DELETE /api/projects/:id Delete project" do
  #   delete "/api/projects/#{projects(:sample).id}", {}, user_authentication_headers(users(:pierre))
  #   assert_response :success
  # end
end
