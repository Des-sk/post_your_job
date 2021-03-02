require './config/environment'

use Rack::MethodOverride
use JobPostsController
run ApplicationController
