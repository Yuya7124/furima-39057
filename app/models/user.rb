class User < ApplicationRecord
  after_validation :remove_unnecessary_error_messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/

  validates :nickname, presence: true
  validates :surname, presence: true, format: { with: VALID_NAME_REGEX }
  validates :given_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :read_surname, presence: true, format: { with: VALID_READ_NAME_REGEX }
  validates :read_given_name, presence: true, format: { with: VALID_READ_NAME_REGEX }
  validates :birth_data, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  has_many :items

  def remove_unnecessary_error_messages
    errors.messages.delete(:users)
  end
end
