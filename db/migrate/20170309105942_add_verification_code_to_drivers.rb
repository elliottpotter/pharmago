class AddVerificationCodeToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :verification_code, :string
  end
end
