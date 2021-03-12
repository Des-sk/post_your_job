class RecruitersController < ApplicationController

    
    get '/signup' do
        erb :'recruiters/signup'
    end

    post '/signup' do
    
        recruiter = Recruiter.new(params)
  
        if recruiter.email.blank? || recruiter.name.blank? || recruiter.password.blank?|| Recruiter.find_by_email(params[:email])
            redirect '/signup' 
        else
            recruiter.save
            session[:recruiter_id] = recruiter.id 
            redirect '/job_posts'    
        end        
    end
    

    get '/login' do
        erb :'recruiters/login'
    end

    post '/login' do
        recruiter = Recruiter.find_by_email(params[:email])
       
        if recruiter && recruiter.authenticate(params[:password])
        
            session[:recruiter_id] = recruiter.id
            redirect '/job_posts'
        else
            flash[:error] = "Invalid Login"
            redirect '/login'
        end

    end

    get '/recruiters' do
        @recruiters = Recruiter.all
        erb :'recruiters/index'
    end

    
    get '/recruiters/:id' do
        @recruiter = Recruiter.find_by(id:params[:id])
        @job_posts = @recruiter.job_posts
        erb :'recruiters/profile'
    end
    

    get '/logout' do 
        session.clear
        redirect '/login'
    end



   



end