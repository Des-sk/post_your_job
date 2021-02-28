class AddRecruiterIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :recruiter_id, :integer
  end
end
