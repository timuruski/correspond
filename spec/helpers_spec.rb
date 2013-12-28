require 'spec_helper'
require 'correspond/helpers'

describe Helpers do
  subject { Object.new.extend Helpers }

  describe "#headerize" do
    it "strips HTTP_ prefix" do
      key = subject.headerize('HTTP_CONNECTION')
      expect(key).to eq('Connection')
    end

    it "converts snake-case to title-case" do
      key = subject.headerize('CONTENT_TYPE')
      expect(key).to eql('Content-Type')
    end

    it "converts a Rack header to HTTP header" do
      key = subject.headerize('HTTP_IF_MODIFIED_SINCE')
      expect(key).to eql('If-Modified-Since')
    end
  end

  describe "#extract_headers" do
    Request = Struct.new(:env)

    it "extracts headers prefixed with HTTP_" do
      request = Request.new('HTTP_CONNECTION' => 'close', 'PATH_INFO' => '1.0')
      expected_headers = {'Connection' => 'close'}

      headers = subject.extract_headers(request)
      expect(headers).to eql(expected_headers)
    end

    it "ignores HTTP_VERSION" do
      request = Request.new('HTTP_VERSION' => 'HTTP/1.1')
      expected_headers = {}

      headers = subject.extract_headers(request)
      expect(headers).to be_empty
    end

    it "converts rack-style to http-style" do
      request = Request.new('HTTP_IF_NONE_MATCH' => 'foobar')
      expected_headers = {'If-None-Match' => 'foobar'}

      headers = subject.extract_headers(request)
      expect(headers).to eql(expected_headers)
    end
  end
end
