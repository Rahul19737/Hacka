class RenameEmployeeIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :create_challenges, :employee_id, :user_id
    rename_column :users, :employee_id, :user_id
  end
end
