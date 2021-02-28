class RemoveClientsIdFromJobPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_posts, :clients_id, :integer
  end
end
