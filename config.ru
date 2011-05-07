# This file is used by Rack-based servers to start the application.
require 'rack-canonical-host'

use Rack::CanonicalHost, 'finessociales.es' if ENV['RACK_ENV']=='production'

require ::File.expand_path('../config/environment',  __FILE__)
run Finessociales::Application
