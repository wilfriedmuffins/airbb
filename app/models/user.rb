class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable

  validates :name, length: { maximum: 100 } 
          
  has_many :bookings, dependent: :destroy
  has_many :logements, dependent: :destroy
  
  # validate :admin

  # def admin
  #   if @user.id = 11
  #     @user.admin = true
  #   end
  # end
  
end
