class AddProfileImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_image_id, :string
  end
end
