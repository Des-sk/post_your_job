class Recruiter < ActiveRecord::Base
    has_many :job_posts
    has_many :clients
    has_secure_password
        #from active record- adds salt to password
end

    #has many methods
    #recruiter.job_posts / ruturns and array, a collection, we can iterait ..end
    #recruiter.job_posts<< () shovel a new job_post to recruiters collection
    #recruiter.posts.build(hash of atributes)
    #recruiter.posts.create(hash of atributes)