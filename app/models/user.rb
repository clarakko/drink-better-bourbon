class User < ActiveRecord::Base
  has_many :votes
  has_many :bourbons
  has_many :reviews, dependent: :destroy

  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  mount_uploader :profile_pic, ProfilePicUploader

  validates :username, presence: true

  def admin?
    role == 'admin'
  end
end
