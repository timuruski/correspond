$:.unshift File.expand_path('lib')
require 'correspond'

run Correspond::App.new
