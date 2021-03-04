class JobPostsController < ApplicationController
    
    # @instance variables- to comunicate our cotrollers with our views
    # show our user something= get
    # expecting to receive data back= post


    #all jobposts
    #index route
    get '/job_posts' do
        @job_posts = JobPost.all
        erb :'job_posts/index'
    end

     #request to view form to add a new jobpost
    get '/job_posts/new' do
        erb :'job_posts/new'
    end

   
    #details of 1 post, tiene id= dinamic route- changes data based on incoming request
    #show route
    get '/job_posts/:id' do
         get_job_post
         erb :'job_posts/show'
        #get the requested post- params
        #show details
    end

    #user submitted the new post form
    post '/job_posts' do
        #create new post
        #redirect user somewhere
        @job_post = JobPost.new(params)
        #jobpost belongs to recruiter
        @job_post.recruiter_id = session[:recruiter_id]
        @job_post.save
        redirect "/job_posts/#{@job_post.id}"

    end

    #request to see edit form
    get '/job_posts/:id/edit' do
        #retreive the obeject of the id
        #autofill a form with the details of that object
        #render to our user to fillout
        get_job_post
        if @job_post.recruiter == current_user
        erb :"/job_posts/edit"
        else
            flash[:error] = "You are not the owner of this Job Post"
            redirect '/job_posts'
        end
    end

    #user submited edit form
    patch '/job_posts/:id' do
        #patch updates an existing object
        #no view
        #update object with new attributes
        get_job_post
        if @job_post.recruiter == current_user
            @job_post.update(title: params[:title], requirements: params[:requirements], salary_range: params[:salary_range], recruiter_id: params[:recruiter_id], recruiter_email: params[:recruiter_email])
            redirect "/job_posts/#{@job_post.id}"   
        else
            flash[:error] = "You are not the owner of this Job Post"
            redirect '/job_posts'
        end
    end

    #delete existing post
    delete '/job_posts/:id' do
        #no view
        get_job_post
        @job_post.destroy
        redirect '/job_posts'
    end


end

