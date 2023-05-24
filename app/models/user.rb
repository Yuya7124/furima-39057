class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :surname, presence: true
  validates :given_name, presence: true
  validates :read_surname, presence: true
  validates :read_given_name, presence: true
  validates :birthday, presence: true
end
