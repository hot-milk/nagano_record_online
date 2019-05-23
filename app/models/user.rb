class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_paranoid#論理削除paranoid

  #validates :last_name, :first_name, :ruby_last_name, :ruby_first_name,
   #length: { minimum: 1, maximum: 200 }

  has_many :orders, dependent: :destroy
  has_many :user_products, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :shipments, dependent: :destroy

end
