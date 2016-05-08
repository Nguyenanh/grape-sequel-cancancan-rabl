$:.unshift "./app"

# require 'models'
require 'api/v1/user_api'
require 'models/user'
require 'models/ability'
use Rack::Config do |env|
  env['api.tilt.root'] = 'app/views'
end
Grape::Rabl.configure do |config|
  config.cache_template_loading = true # default: false
end
run V1::UserAPI