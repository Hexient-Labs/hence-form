class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :registerable, :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :confirmable, :validatable

  # Associations
  has_many :submissions
end
