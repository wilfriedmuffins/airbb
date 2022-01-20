class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, :confirmable
          
  has_many :bookings, dependent: :destroy
  has_many :logements, dependent: :destroy


  # validate :admin

  # def admin
  #   if @user.id = 11
  #     @user.admin = true
  #   end
  # end
  
end
