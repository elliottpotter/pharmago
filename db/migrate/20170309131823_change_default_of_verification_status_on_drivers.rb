class ChangeDefaultOfVerificationStatusOnDrivers < ActiveRecord::Migration[5.0]
  def change
    change_column_default :drivers, :verification_status, "unverified"
  end
end
