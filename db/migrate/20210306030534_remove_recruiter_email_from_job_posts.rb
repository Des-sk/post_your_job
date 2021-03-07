class RemoveRecruiterEmailFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :recruiter_email
  end
end
