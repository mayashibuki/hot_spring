class CreateSpringPlaces < ActiveRecord::Migration
  def change
    create_table :spring_places do |t|
      t.integer :area_id
      t.string :name
      t.string :place
      t.string :transportation

      t.timestamps
    end
  end
end
