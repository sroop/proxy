Sinatra Proxy
============

Description
----
##### Technical test for a London tech company
This is a Hello World service which serves a very important message to clients when they hit the /hello_world endpoint. However, this service now needs to be exposed to the Internet, and that means ensuring that clients have the correct API key before they can request it.
The challenge is to write a proxy server that the service can hide behind, safe in the knowledge that the only requests are authenticated already. The HTTP proxy/forwarder accepts requests from client.rb and checks that either the X-API-Key header or api_key query parameter matches "awesomeserver" before forwarding the request to the server.

Technologies used
----
* Ruby
* RSpec
* Web mock
* Rack test

How to test it
----

```sh
git clone git@github.com:sroop/proxy.git
cd proxy
ruby server.rb
ruby proxy.rb
rspec
```