require 'spec_helper'

describe App do
  include RoutesTestHelpers
  describe "GET /ip" do
    it "returns the originating IP address" do
      get '/ip'

      expect(last_response)
        .to be_json_with_key('origin')
        .and_value('127.0.0.1')
    end
  end

  describe "GET /user-agent" do
    it "returns the User-Agent string" do
      get '/user-agent', {}, {'HTTP_USER_AGENT' => 'Rack::Test'}

      expect(last_response)
        .to be_json_with_key('agent')
        .and_value('Rack::Test')
    end
  end

  describe "GET /headers" do
    it "returns a hash of HTTP headers" do
      env = {'HTTP_X_CUSTOM_HEADER' => 'foo'}
      get '/headers', {}, env

      expected_headers = {'X-Custom-Header' => 'foo'}

      expect(last_response)
        .to be_json_with_key('headers')
        .and_value_like(expected_headers)
    end
  end
end
