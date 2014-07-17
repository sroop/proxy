ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './proxy'

describe 'Proxy' do
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  # it 'forwards requests from the homepage to the server' do
  #   get('http://localhost:9000/')
  #   stubbed_get = stub_request(:get, 'http://localhost:4567/')
  #   expect(stubbed_get).to have_been_requested
  # end

  # it 'requests to the server are correctly returned' do
  #   get('http://localhost:9000/')
  #   stubbed_get = stub_request(:get, 'http://localhost:4567/')
  #   expect(last_response.body).to eq("welcome")
  # end

  # it 'does not forward requests from hello_world page to the server' do
  #   get('http://localhost:9000/hello_world')
  #   stubbed_get = stub_request(:get, 'http://localhost:4567/')
  #   expect(stubbed_get).to_not have_been_requested
  # end

  # it 'forwards requests to the server with the api key in the headers to access hello_world' do
  #   get('http://localhost:9000/hello_world')
  #   stubbed_get = stub_request(:get, 'http://localhost:4567/hello_world').with(headers: {'X-Api-Key'=>'awesomeserver'} )
  #   expect(stubbed_get).to have_been_requested
  # end

  # it 'forwards requests to the server with the api key in the url to access hello_world' do
  #   get('http://localhost:9000/hello_world?api_key=awesomeserver')
  #   stubbed_get = stub_request(:get, 'http://localhost:4567/hello_world').with(headers: {'X-Api-Key'=>'awesomeserver'} )
  #   expect(stubbed_get).to have_been_requested
  # end

  context 'the servers response' do

    it 'returns status code 400 when client does not request via the proxy' do
      get('http://localhost:4567/')
      expect(last_response.status).to eq(400)
    end
    
  end

end