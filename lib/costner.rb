require 'sinatra'
require 'pry'

class Costner < Sinatra::Base
  post '/notifications/github' do
    status, body = FooFoBerry::GitHubNotification.new(params[:payload]).save!
    puts "status is #{status}"
    puts "body is #{body}"
    return nil
  end

  post '/notifications/tracker' do
    status, body = FooFoBerry::TrackerNotification.new(params[:payload]).save!
    return nil
  end
end
