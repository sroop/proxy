ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './proxy'

describe 'Proxy' do
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'The proxy does not forward to the server without the API key' do
    expect{get('http://localhost:9000/')}.to raise_error("No API key")
  end

  context 'The server only responds to client requests via the proxy' do

    # it 'status code 400 when client requests directly to the server' do
    #   get 'localhost:9000', headers: { 'X-API-KEY' => 'test:test' }
    #   stubbed_get = stub_request(:get, "http://localhost:4567")
    #   expect(stubbed_get).to have_been_requested
    # end

    # it 'status code 200 when the client requests via the the proxy' do
    #   get('http://localhost:9000/')
    #   expect(last_response.status).to eq(200)
    # end

  end

end