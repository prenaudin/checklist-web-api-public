require 'rspec_api_documentation/dsl'

resource 'API::Projects' do

  get '/api/projects' do
    example_request 'Get all projects' do
      response = JSON.parse(response_body)
      expect(status).to eq(200)
    end
  end

end
