ENV['RACK_ENV'] = 'test'

require 'spec_helper'
require './proxy'

describe 'Proxy' do
    include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  it 'forwards requests to the server' do
    get 'http://localhost:9000/'#, headers: { 'X-API-KEY' => 'awesomeserver' }
    stubbed_get = stub_request :get, 'http://localhost:4567/'
    expect(stubbed_get).to have_been_requested
  end

end