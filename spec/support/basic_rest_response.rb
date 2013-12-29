shared_examples_for "basic REST response" do |method, path|
  before do
    current_session.send(method, path)
  end

  it "responds with JSON" do
    expect(last_response).to be_successful
    expect(last_response).to be_json
  end

  it "returns the request URL" do
    url = "http://example.org#{path}"

    expect(last_response)
      .to be_json_with_key('url')
      .and_value(url)
  end

  it "returns the originating IP address" do
    expect(last_response)
      .to be_json_with_key('origin')
      .and_value('127.0.0.1')
  end

  it "returns the request headers" do
    expected_headers = {'Host' => 'example.org',
                        'Cookie' => ''}

    expect(last_response)
      .to be_json_with_key('headers')
      .and_value(expected_headers)
  end
end
