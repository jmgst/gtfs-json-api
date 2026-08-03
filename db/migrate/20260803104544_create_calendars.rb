class CreateCalendars < ActiveRecord::Migration[8.1]
  def change
    create_table :calendars do |t|
      t.string :service_id
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
    add_index :calendars, :service_id, unique: true
  end
end
