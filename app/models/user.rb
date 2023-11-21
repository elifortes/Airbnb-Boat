class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
          :recoverable, :rememberable, :validatable

  has_one_attached :photo, dependent: :destroy
=======
         :recoverable, :rememberable, :validatable

  # has_one_attached :photo, dependent: :destroy
>>>>>>> master
end
