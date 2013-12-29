# Acceptance tests
require 'correspond'

Dir.glob("spec/**/*steps.rb") do |path|
  anonymous = true
  load path, anonymous
end

require 'turnip/capybara'
Capybara.app = Correspond::App.new
