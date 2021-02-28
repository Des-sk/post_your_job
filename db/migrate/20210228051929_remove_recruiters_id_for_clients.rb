class RemoveRecruitersIdForClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :recruiters_id, :integer
  end
end
