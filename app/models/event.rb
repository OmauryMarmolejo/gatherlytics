class Event < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :invited_users, through: :invitations, source: :user

  validates :title, :description, :date, :location, presence: true
end
