class User < ActiveRecord::Base
  has_many :reviews
  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  validates :username, presence: true

  def admin?
    role == 'admin'
  end
end
