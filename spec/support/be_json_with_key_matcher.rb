RSpec::Matchers.define :be_json_with_key do |key|
  chain :and_value do |value|
    @expected_value = value
  end

  chain :and_value_like do |fuzzy_value|
    @expected_value =
      case fuzzy_value
      when Hash
        like_hash(fuzzy_value)
      else
        fuzzy_value
      end
  end

  match do |response|
    json = JSON.parse(response.body)
    @value = json.fetch(key)
    @expected_value === @value
  end

  failure_message_for_should do |request|
    %Q(expected key "#{key} to have value #{@expected_value}, got #{@value})
  end

  def like_hash(expected_hash)
    Proc.new do |actual_hash|
      expected_hash.all? { |key, expected_value|
        actual_hash.fetch(key) == expected_value }
    end
  end
end
