class User < ApplicationRecord
  after_validation :remove_unnecessary_error_messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_READ_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
    validates :nickname
    validates :surname, format: { with: VALID_NAME_REGEX, allow_blank: true }
    validates :given_name, format: { with: VALID_NAME_REGEX, allow_blank: true }
    validates :read_surname, format: { with: VALID_READ_NAME_REGEX, allow_blank: true }
    validates :read_given_name, format: { with: VALID_READ_NAME_REGEX, allow_blank: true }
    validates :birth_data
    validates :password, format: { with: VALID_PASSWORD_REGEX, allow_blank: true }
  end

  has_many :items
  has_many :orders

  def remove_unnecessary_error_messages
    errors.messages.delete(:users)
  end
end
