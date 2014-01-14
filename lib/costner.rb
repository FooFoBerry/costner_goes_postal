require 'sinatra'
require 'pry'

class Costner < Sinatra::Base

  post '/github' do
    binding.pry
  end
end
