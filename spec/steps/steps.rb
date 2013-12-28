step "I request /get" do
  visit '/get'
end

step "the response should have a 200 status code" do
  expect(page.status_code).to eq(200)
end
