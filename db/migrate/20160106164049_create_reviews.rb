class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :bourbon, null: false
      t.belongs_to :user, null: false
      t.string :description, null: false
      t.string :rating, null: false

      t.timestamps null: false
    end
    add_index :reviews, [:bourbon_id, :user_id], unique: true
  end
end
