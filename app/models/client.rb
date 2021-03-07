class Client < ActiveRecord::Base
    belongs_to :recruiter
    belongs_to :job_post

    

end