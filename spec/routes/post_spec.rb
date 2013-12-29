require 'spec_helper'

describe App, '/post' do
  include RoutesTestHelpers
  include_examples "basic REST response", :post, '/post'
end
