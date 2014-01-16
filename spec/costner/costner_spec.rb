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
    json = "{}"
    data = double
    FooFoBerry::GitHubNotification.stub(:new).with(json).and_return(data)
    expect(data).to receive(:save!)
    #expect_any_instance_of(FooFoBerry::GitHubNotification).to receive(:save!)

    post '/github',  { "payload" => json }, content_type

    print last_response.body
    expect(last_response.status).to eq 200

    #expect_any_instance_of(FooFoBerry::GitHubNotification).to receive(:save!)
    #FooFoBerry::GitHubNotification.any_instance.should_receive(:save!).with()
    #
    # STUB OUT NEW with params
    # => to send back stub, and expect that naked stub to receive :save!
    # magic tricks of testing Sandi Metz

    # 1.
    # can assert api gives you the right things
    # 2.
    # given i've received this, i return this thing
    #
    # PROBLEM: What if they drift?
    # SOLUTION: Sanity check with VCR
  end

end
