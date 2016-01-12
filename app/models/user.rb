class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  has_many :bourbons
  has_many :reviews, dependent: :destroy

  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  validates :username, presence: true

  def admin?
    role == 'admin'
  end
end
