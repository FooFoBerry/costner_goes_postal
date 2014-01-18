require './spec/spec_helper'
require './lib/costner'

describe Costner do
  include Rack::Test::Methods

  def app
    Costner.new
  end

  def content_type
    {"Content-Type" => "application/json"}
  end

  it "should 200 response for a post on GitHub Callback" do
    json = File.read('./spec/fixtures/github_payload.json')
    FooFoBerry::GitHubNotification.any_instance.stub(:save!)
    post '/notifications/github',  { "payload" => json }, content_type

    expect(last_response.status).to eq 200
    #expect_any_instance_of(FooFoBerry::GitHubNotification).to receive(:save!)
    #FooFoBerry::GitHubNotification.any_instance.should_receive(:save!).with()
  end

end
