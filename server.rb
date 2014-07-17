# encoding: utf-8

require 'rubygems'
require 'sinatra'

get '/' do
  halt 400, "Unauthorized access....GTFO!!!" unless (env['HTTP_X_API_KEY'] || params['api_key']) == 'awesomeserver'
  "welcome"
end

get '/hello_world' do
  halt 400, "Unauthorized access....GTFO!!!" unless (env['HTTP_X_API_KEY'] || params['api_key']) == 'awesomeserver'
  "hello world"
end
