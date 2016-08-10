class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :email, uniqueness: true
    validates :password, confirmation: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true
   end
