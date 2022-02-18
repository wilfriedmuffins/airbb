class Comment < ApplicationRecord
  belongs_to :logement, counter_cache: true
  belongs_to :user

  validates :user_id, uniqueness: true
end