require "sinatra"
require "msgpack"

use Rack::Logger

set :port, 8126
set :bind, "0.0.0.0"

helpers do
  def logger
    request.logger
  end
end

get "/ping" do
  logger.info "pong"
end

put "/:version/traces" do
  logger.info MessagePack.unpack(request.body.read)
end
