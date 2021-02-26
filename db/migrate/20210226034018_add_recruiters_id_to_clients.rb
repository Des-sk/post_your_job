class AddRecruitersIdToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :recruiters_id, :integer
  end
end
