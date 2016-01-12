class AddBourbonsUserConstraint < ActiveRecord::Migration
  def up
    change_column :bourbons, :user_id, :integer, null: false
  end

  def down
    change_column :bourbons, :user_id, :integer
  end
end
