class CreateChallenge < ApplicationRecord
    belongs_to :user
    validates :title, :description, :tags, presence: true
end
