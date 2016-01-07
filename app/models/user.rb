class User < ActiveRecord::Base
  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  validates :username, presence: true
  has_many :reviews
end
