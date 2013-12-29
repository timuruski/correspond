require 'spec_helper'

describe App, '/get' do
  include RoutesTestHelpers
  include_examples "basic REST response", :get, '/get'

  it "returns the request arguments" do
    get '/get?name=alice&group=staff'

    expected_args = {'name' => 'alice',
                     'group' => 'staff'}

    expect(last_response)
      .to be_json_with_key('args')
      .and_value(expected_args)
  end
end
