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
