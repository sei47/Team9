class AddindexStations < ActiveRecord::Migration[6.0]
  def change
      add_reference :stations, :property, foreign_key: true
  end
end
