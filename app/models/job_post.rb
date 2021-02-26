class JobPost < ActiveRecord::Base
    #belongs to a recruiter, belongs to a client

    belongs_to :recruiter 

    #belongs_to methods:
    #job_post.recruiter / read the recruiter this job post belongs to
    #job_post.recruiter= / set the recruiter this job post belongs to
    #job_post.build_author(hash of attributes) / .save to persist
    #job_post.creates_author(hash of attributes) / creates and persists
    belongs _to :client

end