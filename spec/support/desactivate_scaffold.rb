RSpec.configure do |config|
  config.before(:each) do
    allow(SystemScaffoldProjectForUserContext).to receive(:call)
      .and_return(true)
  end
end
