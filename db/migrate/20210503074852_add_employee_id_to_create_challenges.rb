class AddEmployeeIdToCreateChallenges < ActiveRecord::Migration[5.1]
  def change
    add_column :create_challenges, :employee_id, :string
    add_index :create_challenges, :employee_id
  end
end
