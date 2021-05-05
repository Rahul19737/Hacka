class CreateCollaborates < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborates do |t|
      t.references :create_challenge, foreign_key: true
      t.references :user, foreign_key: true
      t.string :employee_id

      t.timestamps
    end
  end
end
