class Bourbon < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :user, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :proof, presence: true
  validates :proof, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 200 }
  validates :proof, length: { maximum: 4 }

  mount_uploader :bourbon_img, BourbonImgUploader

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
