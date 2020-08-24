class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_option presence: true do
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥], message: "is invalid. Input full_width characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥], message: "is invalid. Input full_width characters."}
    validates :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full_width characters."}
    validates :first_name_reading, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full_width characters."}
    validates :birthday
    validates :nickname
    validates :email, format: { with: /@.+/ }, uniqueness: true
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i、message: "is invalid. Input include both letters and numbers"}, length: {minimum: 6}, confirmation: true
    validates :password_confirmation
  end
end
