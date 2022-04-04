class CreateSightings < ActiveRecord::Migration[7.0]
  def change
    create_table :sightings do |t|
      t.integer :animal_id
      t.datetime :data
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
