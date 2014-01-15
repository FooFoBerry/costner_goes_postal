require 'sinatra'
require 'pry'

class Costner < Sinatra::Base
  post '/github' do
    FooFoBerry::GitHubNotification.new(params[:payload]).save!
  end
end
