class CreateAgencies < ActiveRecord::Migration[8.1]
  def change
    create_table :agencies do |t|
      t.string :agency_id
      t.string :agency_name
      t.string :agency_url
      t.string :agency_timezone
      t.string :agency_lang
      t.string :agency_phone

      t.timestamps
    end
    add_index :agencies, :agency_id, unique: true
  end
end
