# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           default(""), not null
#  encrypted_password   :string           default(""), not null
#  confirmation_token   :string
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  unconfirmed_email    :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token  (confirmation_token) UNIQUE
#  index_users_on_email               (email) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :registerable, :recoverable, :rememberable, :trackable
  devise :database_authenticatable, :confirmable, :validatable

  # Associations
  has_many :submissions, inverse_of: "user"

  # Override to send devise emails asynchronously
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
