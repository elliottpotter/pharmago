class AddPhotoUrlToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :photo_url, :string
  end
end
