#require './config/environment'

class ApplicationController < Sinatra::Base

  #Sinatra::Base- http verbs/commands- delet, get, porst, patch, put
  #one controller for every model
  
  #app.controller- any req. that does not belong to a mdels data goes in app.controller
    #about route, contact page
  
  #Post / Put / Patch- receiving something from user/ doesnt have a view
  
    #layout.erb
    # view file that renders across app.  menue bar, navigation, search form, footer
  
  #views mimic CRUD actions 

 
  configure do
    
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    #secure- .env file with key and value pair, like IPA key in cli
    set :public_folder, 'public'
    register Sinatra::Flash
  end

  get '/' do
    erb :welcome
  end

  helpers do


     # return the logged in user
    def current_user # return logged in user 
      @current_user ||= Recruiter.find_by_id(session[:recruiter_id]) #memoization
    end 

    # check if a user logged in
    def logged_in?
        !!session[:recruiter_id]
    end  

    def get_job_post
      @job_post = JobPost.find_by(id:params[:id])
    end


  end



end
