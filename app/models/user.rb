class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :shoes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :code, inclusion: {in: ["493021"], message: "%{value} is incorrect" }
end
