require 'spec_helper'

describe App, '/post' do
  include AppTestMethods

  let(:app) { Correspond::App.new }
  include_examples "basic REST response", :post, '/post'
end
