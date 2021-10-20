class Booking < ApplicationRecord
  belongs_to :logement
  belongs_to :user
end
