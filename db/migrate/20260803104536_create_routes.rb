class CreateRoutes < ActiveRecord::Migration[8.1]
  def change
    create_table :routes do |t|
      t.string :route_id
      t.references :agency, null: false, foreign_key: true
      t.string :route_short_name
      t.string :route_long_name
      t.integer :route_type
      t.string :route_color
      t.string :route_text_color

      t.timestamps
    end
    add_index :routes, :route_id, unique: true
  end
end
