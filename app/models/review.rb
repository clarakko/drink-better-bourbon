class Review < ActiveRecord::Base
  belongs_to :bourbon
  belongs_to :user

  validates :user_id, uniqueness: {scope: :bourbon_id}
  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 100 }
end
