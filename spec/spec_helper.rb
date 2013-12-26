$:.unshift File.expand_path('lib')
require 'correspond'

include Correspond

# Require test libraries
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
# require 'mocha/setup'
