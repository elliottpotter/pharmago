class AddVerificationStatusToDrivers < ActiveRecord::Migration[5.0]
  def change
    add_column :drivers, :verification_status, :string
  end
end
