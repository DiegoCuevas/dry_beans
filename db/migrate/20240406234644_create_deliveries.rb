class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|
      t.references :path, null: false, foreign_key: true
      t.string :description
      t.integer :status
      t.date :delivery_date
      t.time :delivery_time

      t.timestamps
    end
  end
end
