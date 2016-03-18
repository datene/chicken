class ChangePhotoUrlToPicture < ActiveRecord::Migration
  def up
    rename_column :users, :photo_url, :picture
  end

  def down
    rename_column :users, :picture, :photo_url
  end
end
