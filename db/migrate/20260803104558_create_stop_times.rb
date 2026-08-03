class CreateStopTimes < ActiveRecord::Migration[8.1]
  def change
    create_table :stop_times do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.string :arrival_time
      t.string :departure_time
      t.integer :stop_sequence
      t.integer :pickup_type
      t.integer :drop_off_type

      t.timestamps
    end
  end
end
