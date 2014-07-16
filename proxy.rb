# encoding: utf-8

#
# Oh no! I lost my codez :'(
#
require 'sinatra'
require 'net/http'
require 'uri'

set :port, '9000'
server_port = ENV['PORT'] || '4567'
my_api_key = 'awesomeserver'

get '/*' do |path|
  url = URI.parse("http://localhost:#{server_port}#{request.path_info}?api_key=#{my_api_key}")
  client_request_to_server = Net::HTTP::Get.new(url.path)
  client_request_to_server['X-API-Key'] = 'awesomeserver'
  server_response = Net::HTTP.start(url.host, url.port) do |http|
    http.request(client_request_to_server)
  end
  server_response.body
end