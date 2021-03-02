class AddNewAttributeToRecruiters < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :password_digest, :string
  end
end
