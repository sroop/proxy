# encoding: utf-8

#
# Oh no! I lost my codez :'(
#
require 'sinatra'
require 'net/http'
require 'uri'

set :port, '9000'
server_port = ENV['PORT'] || '4567'