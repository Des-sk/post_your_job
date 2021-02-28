class RemoveRecruitersIdFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :recruiters_id, :integer
  end
end
