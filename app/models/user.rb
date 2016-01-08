class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  validates :username, presence: true
end
