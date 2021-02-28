class AddClientIdRecruiterIdToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :job_posts, :recruiter_id, :integer
    add_column :job_posts, :client_id, :integer
  end
end
