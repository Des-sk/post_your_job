class JobPostsController < ApplicationController

    #all postsjob posts
    get '/job_posts' do
        @job_posts = JobPost.all
        erb :'job_posts/index'
    end

end