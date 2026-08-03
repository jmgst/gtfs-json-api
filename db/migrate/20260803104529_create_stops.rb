class CreateStops < ActiveRecord::Migration[8.1]
  def change
    create_table :stops do |t|
      t.string :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.decimal :stop_lat
      t.decimal :stop_lon
      t.string :zone_id
      t.integer :location_type
      t.integer :wheelchair_boarding

      t.timestamps
    end
    add_index :stops, :stop_id, unique: true
  end
end
