class Vote < ApplicationRecord
  belongs_to :create_challenge
  belongs_to :user
end
