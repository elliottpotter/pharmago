class ChangeColumnOnOrders < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :status, :aasm_state
  end
end
