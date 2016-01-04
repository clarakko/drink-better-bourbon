class CreateBourbons < ActiveRecord::Migration
  def change
    create_table :bourbons do |t|
      # t.belongs_to :users, null: false
      t.string :name, null: false
      t.string :proof, null: false
      t.string :varietal
      t.string :distillery

      t.timestamps null: false
    end

    # add_index :bourbons, :user_id
    add_index :bourbons, :name
  end
end
