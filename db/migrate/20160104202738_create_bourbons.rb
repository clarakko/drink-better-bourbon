class CreateBourbons < ActiveRecord::Migration
  def change
    create_table :bourbons do |t|
      t.belongs_to :user
      t.string :name, null: false, unique: true
      t.string :proof, null: false
      t.string :varietal
      t.string :distillery

      t.timestamps null: false
    end
    add_index :bourbons, :name
  end
end
