class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_many :events, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :invited_events, through: :invitations, source: :event

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
