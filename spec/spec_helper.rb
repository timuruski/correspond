$:.unshift File.expand_path('lib')
require 'correspond'
include Correspond

require 'rack/test'

module Correspond
  module AppTestMethods
    include Rack::Test::Methods

    def response_json
      JSON.parse(last_response.body)
    end
  end
end


RSpec::Matchers.define :be_json do
  match do |request|
    content_type = content_type_for(request)
    content_type =~ %r(application/json)
  end

  failure_message_for_should do |request|
    content_type = content_type_for(request)
    %Q(expected Content-Type to be "application/json", got "#{content_type}")
  end

  def content_type_for(request)
    request.headers.fetch('Content-Type')
  end
end

RSpec::Matchers.define :be_json_with_key do |key|
  chain :and_value do |value|
    @expected_value = value
  end

  match do |response|
    json = JSON.parse(response.body)
    @value = json.fetch(key)
    @value == @expected_value
  end

  failure_message_for_should do |request|
    %Q(expected key "#{key} to have value #{@expected_value}, got #{@value})
  end
end
