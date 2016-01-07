class AddBourbonsUserConstraint < ActiveRecord::Migration
  def change
    change_column :bourbons, :user_id, :integer, null: false
  end
end
