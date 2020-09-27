class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 
  has_many :car_users
  has_many :cars, through: :car_users
  # validates :name, presence: true, uniqueness: true
  
end
