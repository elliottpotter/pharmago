class RemovePhotoUrlFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :photo_url
  end
end
