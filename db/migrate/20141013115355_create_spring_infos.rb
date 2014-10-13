class CreateSpringInfos < ActiveRecord::Migration
  def change
    create_table :spring_infos do |t|
      t.integer :area_id
      t.string :name
      t.integer :category_id
      t.string :quality_name
      t.string :old_quality_name
      t.float :temperature
      t.float :pH
      t.integer :osmotic_id
      t.float :discharge
      t.string :place
      t.string :transportation
      t.float :metasilicic_acid
      t.string :remarks

      t.timestamps
    end
  end
end
