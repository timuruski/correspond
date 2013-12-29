require 'bundler/setup'
require 'json'
require 'pry'
require 'sinatra/base'

module Correspond
  autoload :App, 'correspond/app'
  autoload :Helpers, 'correspond/helpers'
end
