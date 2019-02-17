class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_many :events
  has_many :attendances
  has_many :events, through: :attendances

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :description, presence: true, length: { in: 5..140 }

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def thumbnail
    return self.avatar.variant(resize: '200x200')
  end

end
