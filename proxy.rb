# encoding: utf-8

#
# Oh no! I lost my codez :'(
#
require 'sinatra'
require 'net/http'
require 'uri'

set :port, '9000'
server_port = ENV['PORT'] || '4567'
my_api_key = 'test:test'

get '/*' do |path|
  puts params.inspect
  raise 'No API key' unless (params[:api_key] || env['HTTP_X_API_KEY'])
  url = URI.parse("http://localhost:#{server_port}/#{params[:splat].join}")
  client_request_to_server = Net::HTTP::Get.new(url.path)
  server_response = Net::HTTP.start(url.host, url.port) do |http|
    http.request(client_request_to_server)
  end
  server_response.code
  server_response.body

end