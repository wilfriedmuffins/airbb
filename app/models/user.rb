class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable


# validates :name, presence: true, 
#           uniqueness: { case_sensitive: false }, 
#           length: {minimum: 3, maximum: 25}

# VALID_EMAIL_REGEX = /.+\@.+\..+/i

# validates :email, presence: true, 
#       uniqueness: { case_sensitive: false }, 
#       format: { with: VALID_EMAIL_REGEX}

  has_many :logements, dependent: :destroy
end
