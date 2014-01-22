require 'bundler'
Bundler.require

ENV["RACK_ENV"] = "test"

require 'rspec'
require 'rspec/autorun'
require 'rack/test'
require 'pry'
require 'coveralls'
Coveralls.wear!
