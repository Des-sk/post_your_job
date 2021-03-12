class JobPostsController < ApplicationController
    
   
    get '/job_posts' do
        @job_posts = JobPost.all
        erb :'job_posts/index'
    end

   
    get '/job_posts/new' do
        erb :'/job_posts/new'
    end


    get '/job_posts/:id' do
         get_job_post
         @recruiter = Recruiter.find_by_id(params[:id])
         erb :'/job_posts/show'
    end 
    
    
    post '/job_posts' do
        
        @job_post = JobPost.new(params)
      
        @job_post.recruiter_id = session[:recruiter_id]
     
        @job_post.save
        redirect "/job_posts/#{@job_post.id}"

    end

   
    get '/job_posts/:id/edit' do
       
        get_job_post
        if @job_post.recruiter == current_user
        erb :"/job_posts/edit"
        else
            flash[:error] = "You are not the owner of this Job Post"
            redirect '/job_posts'
        end
    end


    patch '/job_posts/:id' do
        
        get_job_post
        if @job_post.recruiter == current_user
            @job_post.update(title: params[:title], requirements: params[:requirements], salary_range: params[:salary_range])
            redirect "/job_posts/#{@job_post.id}"   
        else
            flash[:error] = "You are not the owner of this Job Post"
            redirect '/job_posts'
        end
    end


    delete '/job_posts/:id' do
     
        get_job_post
        if @job_post.recruiter == current_user
            @job_post.destroy
            redirect '/job_posts'
        else
            flash[:error] = "You are not the owner of this Job Post"
            redirect '/job_posts'
        end
    end
        
    

end

