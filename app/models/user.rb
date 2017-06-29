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
