class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :artist_name
      t.string :artist_image
      t.string :venue_name
      t.string :location
      t.datetime :date
      t.timestamps null: false
    end
  end
end
