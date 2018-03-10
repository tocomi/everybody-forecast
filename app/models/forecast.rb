class Forecast < ApplicationRecord
  belongs_to :user, foreign_key: [ :user_id ]
  self.primary_keys = :race_id, :user_id, :horse_number
end
