class CreateJourneys < ActiveRecord::Migration[7.1]
  def change
    create_table :journeys do |t|
      t.references :origin, null: false, foreign_key: { to_table: :locations }
      t.references :destination, null: false, foreign_key: { to_table: :locations }
      t.string :name

      t.timestamps
    end
  end
end
