class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :status, presence: true
  validates :user_id, uniqueness: { scope: :event_id }
end
