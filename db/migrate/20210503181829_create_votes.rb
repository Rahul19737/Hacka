class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :vote
      t.string :employee_id
      t.integer :challenge_id

      t.timestamps
    end
  end
end
