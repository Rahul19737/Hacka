class CreateChallenge < ApplicationRecord
    belongs_to :user
    has_many :collaborate
    has_many :vote
    validates :title, :description, :tags, presence: true
end
