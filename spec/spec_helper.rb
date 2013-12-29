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
