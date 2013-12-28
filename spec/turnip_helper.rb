# Acceptance tests
require 'correspond'
require 'turnip/capybara'

Dir.glob("spec/**/*steps.rb") do |path|
  load(path, true)
end

Capybara.app = Correspond::App.new
