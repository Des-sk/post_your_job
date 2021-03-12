
class JobPost < ActiveRecord::Base
    belongs_to :recruiter
    belongs_to :client
end