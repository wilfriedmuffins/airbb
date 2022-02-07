class Comment < ApplicationRecord
  belongs_to :logement, counter_cache: true
  belongs_to :user

  #before_validation :check_double
  
  # def check_double
  #   @double = @logement.comment_ids#.existe?(current_user.id)
  #   puts @double
  #     #errors.add(:start_booking, "logement non disponible à la date de début")
  # end
end
