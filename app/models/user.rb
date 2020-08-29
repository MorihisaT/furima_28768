class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :transactions

  with_options presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters.' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'full-width characters.' }
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full_width characters.' }
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full_width characters.' }
    validates :birthday
    validates :nickname
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'include both letters and numbers' }
end
