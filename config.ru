require './config/environment'

use Rack::MethodOverride
use JobPostsController
use RecruitersController
run ApplicationController
