class AddRecruitersIdToJobPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :job_posts, :recruiters_id, :integer
  end
end
