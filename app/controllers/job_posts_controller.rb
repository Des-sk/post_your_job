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
         @job_post = JobPost.find(params[:id])
         erb :'job_posts/show'
        #get the requested post- params
        #show details
    end

    #user submitted the new post form
    post '/job_posts' do
        #create new post
        #redirect user somewhere
        @job_post = JobPost.create(params)
        redirect "/job_posts/#{@job_post.id}"

    end

    #request to see edit form
    get '/job_posts/:id/edit' do
        #retreive the obeject of the id
        #autofill a form with the details of that object
        #render to our user to fillout
    end

    #user submited edit form
    patch 'job_posts/:id/' do
        #patch updates an existing object
        #no view
        #update object with new attributes
    end

    #delete existing post
    delete'job_post/:id' do
        #no view
    end


end

