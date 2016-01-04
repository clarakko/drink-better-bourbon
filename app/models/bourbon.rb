class Bourbon < ActiveRecord::Base
  # belongs_to :user

  validates :name, presence: true
  validates :proof, presence: true
  # validates :user_id, presence: true


end
