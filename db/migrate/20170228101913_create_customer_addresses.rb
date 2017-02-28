class CreateCustomerAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_addresses do |t|
      t.references :customer, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
