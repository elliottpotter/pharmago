class AddUserCodeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :user_code, :string
  end
end
