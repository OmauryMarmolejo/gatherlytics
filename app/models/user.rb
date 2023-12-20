class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :invited_events, through: :invitations, source: :event

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
