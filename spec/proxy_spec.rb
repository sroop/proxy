ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './proxy'

describe 'Proxy' do
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  context 'The proxy forwards to the server correctly' do
  
    it 'the proxy forwards client requests to the server' do
      get('http://localhost:9000/')
      stubbed_get = stub_request(:get, 'http://localhost:4567/')
      expect(stubbed_get).to have_been_requested
    end

    it 'client requests to the proxy correctly returns the right response from the server' do
      get('http://localhost:9000/hello_world')
      expect(last_response.body).to eq("hello world")
    end

  end

  context 'The server only responds to client requests via the proxy' do

    it 'status code 400 when client requests directly to the server' do
      get('http://localhost:4567/')
      expect(last_response.status).to eq(400)
    end

    it 'status code 200 when the client requests via the the proxy' do
      get('http://localhost:9000/')
      expect(last_response.status).to eq(200)
    end

  end

end