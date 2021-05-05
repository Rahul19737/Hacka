class AddEmployeeIdToCreateChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :create_challenges, :employee_id, :string
  end
end
