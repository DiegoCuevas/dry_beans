class CreatePaths < ActiveRecord::Migration[7.1]
  def change
    create_table :paths do |t|
      t.references :journey, null: false, foreign_key: true
      t.date :delivery_date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
