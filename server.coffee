restify = require 'restify'

###
  Server middleware
###
server = restify.createServer()
server.pre restify.pre.userAgentConnection() # Fix for curl
server.use restify.acceptParser server.acceptable # respond correctly to accept headers
server.use restify.fullResponse() # set CORS, eTag, other common headers
server.use restify.gzipResponse() # Compress the response yo

###
  Static routes
###

server.get /\/*/, restify.serveStatic directory: './public', default: 'index.html', charSet: 'UTF-8'

server.listen process.env.PORT or 80, ->
  console.log "[%s] #{server.name} listening at #{server.url}", process.pid
