class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
  	validates :first_name
  	validates :last_name
  	validates :first_name_kana
  	validates :last_name_kana
  	validates :postal_code
  	validates :address
  	validates :phone_number
  	validates :encrypted_password
  	validates :password_confirmation
  end
end