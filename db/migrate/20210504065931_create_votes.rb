class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :create_challenge, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
