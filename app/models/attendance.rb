class Attendance < ApplicationRecord
  after_create :welcome_send

  belongs_to :user
  belongs_to :event

  validates :stripe_customer_id, presence: true, uniqueness: true

  def welcome_send
    AttendanceMailer.welcome_email(self).deliver_now
  end  
end
