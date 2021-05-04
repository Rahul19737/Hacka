class AddVoteCountToCreateChallenge < ActiveRecord::Migration[5.1]
  def change
    add_column :create_challenges, :vote_count, :integer, null: false, default: 0
  end
end
