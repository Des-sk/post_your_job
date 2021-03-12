
class ApplicationController < Sinatra::Base
 
  configure do
    
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end

  helpers do

     
    def current_user 
      @current_user ||= Recruiter.find_by_id(session[:recruiter_id]) 
    end 

    def logged_in?
        !!session[:recruiter_id]
    end  

    def get_job_post
      @job_post = JobPost.find_by(id:params[:id])
    end


  end



end
