require 'spec_helper'

describe App, '/get' do
  include AppTestMethods

  let(:app) { Correspond::App.new }

  it "responds with JSON" do
    get '/get'

    expect(last_response).to be_successful
    expect(last_response).to be_json
  end

  it "returns the request URL" do
    get '/get'

    expect(last_response)
      .to be_json_with_key('url')
      .and_value('http://example.org/get')
  end

  it "returns the originating IP address" do
    get '/get'

    expect(last_response)
      .to be_json_with_key('origin')
      .and_value('127.0.0.1')
  end

  it "returns the request headers" do
    get '/get'

    expected_headers = {'Host' => 'example.org',
                        'Cookie' => ''}

    expect(last_response)
      .to be_json_with_key('headers')
      .and_value(expected_headers)
  end

  it "returns the request arguments" do
    get '/get?name=alice&group=staff'

    expected_args = {'name' => 'alice',
                     'group' => 'staff'}

    expect(last_response)
      .to be_json_with_key('args')
      .and_value(expected_args)
  end
end
