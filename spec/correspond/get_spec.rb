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

    expect(response_json).to have_key('url')
    expect(response_json['url']).to eq('http://example.org/get')
  end

  it "returns the originating IP address" do
    get '/get'

    expect(response_json).to have_key('origin')
    expect(response_json['origin']).to eq('127.0.0.1')
  end

  it "returns the request headers" do
    get '/get'

    expected_headers = {'Host' => 'example.org',
                        'Cookie' => ''}

    expect(response_json).to have_key('headers')
    expect(response_json['headers']).to eq(expected_headers)
  end

  it "returns the request arguments" do
    get '/get?name=alice&group=staff'

    expected_args = {'name' => 'alice',
                     'group' => 'staff'}

    expect(response_json).to have_key('args')
    expect(response_json['args']).to eq(expected_args)
  end
end
