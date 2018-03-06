class Forecast < ApplicationRecord
  self.primary_keys = :race_id, :user_id, :horse_number
end
