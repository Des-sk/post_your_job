class AddClientsIdToJobPosts < ActiveRecord::Migration[5.2]
    def change
      add_column :job_posts, :clients_id, :integer
    end
end
