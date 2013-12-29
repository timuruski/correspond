step "I request :path" do |path|
  visit path
end

step "the response should be successful" do
  expect(page.status_code).to eq(200)
end

step "the response should be JSON" do
  headers = page.response_headers
  content_type = headers.find([]) { |k,_| /content-type/i === k }[1]
  expect(content_type).to match('application/json')
end
