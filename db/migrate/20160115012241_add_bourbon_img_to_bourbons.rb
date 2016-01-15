class AddBourbonImgToBourbons < ActiveRecord::Migration
  def change
    add_column :bourbons, :bourbon_img, :string
  end
end
