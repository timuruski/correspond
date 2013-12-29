$:.unshift File.expand_path('lib')
require 'correspond'
include Correspond

Dir.glob("spec/support/**/*.rb") do |path|
  anonymous = false
  load path, anonymous
end

require 'rack/test'

module Correspond
  module AppTestMethods
    include Rack::Test::Methods

    def response_json
      JSON.parse(last_response.body)
    end
  end
end

