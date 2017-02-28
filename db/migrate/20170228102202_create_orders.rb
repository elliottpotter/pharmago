class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.date :delivery_date
      t.timestamp :delivered_at
      t.decimal :subtotal
      t.references :customer, foreign_key: true
      t.references :driver, foreign_key: true

      t.timestamps
    end
  end
end
