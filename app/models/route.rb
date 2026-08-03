class Route < ApplicationRecord
  belongs_to :agency
  has_many :trips
end
