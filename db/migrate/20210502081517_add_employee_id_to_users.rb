class AddEmployeeIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :employee_id, :string
    add_index :users, :employee_id, unique: true
  end
end
