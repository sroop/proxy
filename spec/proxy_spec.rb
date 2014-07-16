ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './proxy'

describe 'Proxy' do
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  it 'forwards requests to the server' do
    get('http://localhost:9000/')
    stubbed_get = stub_request(:get, 'http://localhost:4567/')
    expect(stubbed_get).to have_been_requested
  end

  it 'requests to the server are correctly returned' do
    get('http://localhost:9000/')
    stubbed_get = stub_request(:get, 'http://localhost:4567/')
    expect(last_response.body).to eq("welcome")
  end

end