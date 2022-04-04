class SampleNameChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    rename_column(:sightings, :data, :date)
  end
end
