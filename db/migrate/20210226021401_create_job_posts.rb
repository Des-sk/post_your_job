class CreateJobPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.string :requirements
      t.string :salary_range
      t.string :recruiter_email
    end
  end
end