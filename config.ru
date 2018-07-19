require "sinatra"
require "sinatra/contrib"
require "sinatra/reloader" if development?
require "sinatra/cookies"
require "pg"
require_relative "controllers/dbz_controller.rb"
require_relative "models/dbz.rb"

use Rack::MethodOverride
run DBZController
