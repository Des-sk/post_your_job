class RecruitersController < ApplicationController

    #resposible for anything involving recruiter
    #needs:
    #sign up- '/signup' = new action- creating a new recruiter object
    #login- '/login'= read action- find a recruiter and read recruiter attributes
    #logout- '/logout'= delete action- clears our sessions

    get '/signup' do
        erb :'recruiters/signup'
    end

    post '/signup' do
    #receive data from form inside of params hash
    #create a new recruiter object w/ that data
        recruiter = Recruiter.new(params)
    #validate
        if recruiter.email.blank? || recruiter.name.blank? || recruiter.password.blank?|| Recruiter.find_by_email(params[:email])
            redirect '/signup'
            #redirect them back to signup
        
        else
            recruiter.save
            session[:recruiter_id] = recruiter.id #logging user in
            redirect '/job_posts'
            #else recruiter is valid
                #persist the new object
        end       #redirect them   
    end

    get '/login' do
        erb :'recruiters/login'
    end

    post '/login' do
        recruiter = Recruiter.find_by_email(params[:email])
        #if recruiter exists && password is correct
        if recruiter && recruiter.authenticate(params[:password])
            #login recruiter
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
        # if @recruiter.id == @job_posts.recruiter.id
        #   job_posts.each do |title|
        #     puts " Job Posts:"
        #     "#{job_posts.title}"
             erb :'recruiters/profile'
        #   end

        # else 
        #     flash[:error] = "This Recruiter doesnt have a Job Post"
         #   redirect 'recruiters/index'
        # end

     
    end
    

    

    get '/logout' do 
        session.clear
        redirect '/login'
    end



   



end