require 'sinatra'
require 'pry'

class Costner < Sinatra::Base
  post '/notifications/github' do
    FooFoBerry::GitHubNotification.new(params[:payload]).save!
  end
end
