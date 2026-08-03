class CreateTrips < ActiveRecord::Migration[8.1]
  def change
    create_table :trips do |t|
      t.string :trip_id
      t.references :route, null: false, foreign_key: true
      t.string :service_id, null: false
      t.string :trip_headsign
      t.integer :direction_id
      t.integer :wheelchair_accessible

      t.timestamps
    end
    add_index :trips, :trip_id, unique: true
  end
end
