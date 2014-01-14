require './spec/spec_helper'
require './lib/costner'

describe Costner do
  include Rack::Test::Methods

  def app
    Costner.new
  end

  it "should 200 response for a post on GitHub Callback" do
    post '/github'
    expect(last_response.status).to eq 200
  end

end
