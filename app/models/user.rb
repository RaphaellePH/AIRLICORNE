class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :licornes, dependent: :destroy
  has_many :bookings, dependent: :destroy

  has_many :requested_bookings, through: :licornes, source: :bookings
end
