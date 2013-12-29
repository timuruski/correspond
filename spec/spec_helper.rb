$:.unshift File.expand_path('lib')
require 'correspond'
include Correspond

Dir.glob("spec/support/**/*.rb") do |path|
  anonymous = false
  load path, anonymous
end

require 'rack/test'

module Correspond
  module RoutesTestHelpers
    include Rack::Test::Methods

    def self.included(base)
      base.let(:app) { Correspond::App.new }
    end
  end
end

