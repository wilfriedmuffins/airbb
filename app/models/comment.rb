class Comment < ApplicationRecord
  belongs_to :logement, counter_cache: true
  belongs_to :user

  validate :check_double

  private

  def check_double
    @logement = Logement.find(logement_id)
    if @logement.comments.exists?(user_id: user_id)
      errors.add(:user_id, "tu es déjà mis un comentaire")
    end
  end
  


end