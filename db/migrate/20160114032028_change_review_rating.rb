class ChangeReviewRating < ActiveRecord::Migration
  def up
    change_column :reviews, :rating, 'integer USING CAST(rating AS integer)'
  end

  def down
    change_column :reviews, :rating, :string
  end
end
