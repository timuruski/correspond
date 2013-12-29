module Correspond
  class App < Sinatra::Application
    include Helpers

    before do
      content_type :json
    end

    get '/' do
      render 'readme'
    end

    get '/ip' do
      json origin: request.ip
    end

    get '/user-agent' do
      json agent: request.user_agent
    end

    get '/headers' do
      headers = extract_headers(request)
      json headers: Hash[headers]
    end

    get '/get' do
      headers = extract_headers(request)
      json url: request.url,
           origin: request.ip,
           headers: headers,
           args: request.params
    end

    post '/post' do
      headers = extract_headers(request)
      json url: request.url,
           origin: request.ip,
           headers: headers,
           args: request.params
    end

    # / This page.
    # /ip Returns Origin IP.
    # /user-agent Returns user-agent.
    # /headers Returns header dict.
    # /get Returns GET data.
    # /post Returns POST data.
    # /put Returns PUT data.
    # /patch Returns PATCH data.
    # /delete Returns DELETE data
    # /gzip Returns gzip-encoded data.


    get '/pry' do
      binding.pry
    end


    protected

    def json(data = {})
      JSON.pretty_generate(data)
    end

  end
end

