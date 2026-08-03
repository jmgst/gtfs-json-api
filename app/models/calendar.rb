class Calendar < ApplicationRecord
  has_many :trips, foreign_key: :service_id, primary_key: :service_id, inverse_of: :calendar
end
