
class Recruiter < ActiveRecord::Base
    has_many :job_posts
    has_secure_password
      
end

  