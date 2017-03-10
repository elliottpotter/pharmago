class CreatePrescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :prescriptions do |t|
      t.references :customer, foreign_key: true
      t.string :number
      t.string :interval
      t.timestamp :delivery_date

      t.timestamps
    end
  end
end
