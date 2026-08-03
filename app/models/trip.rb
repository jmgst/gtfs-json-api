class Trip < ApplicationRecord
  belongs_to :route
  belongs_to :calendar, foreign_key: :service_id, primary_key: :service_id, inverse_of: :trips
  has_many :stop_times
end
