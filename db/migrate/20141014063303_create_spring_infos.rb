class CreateSpringInfos < ActiveRecord::Migration
  def change
    create_table :spring_infos do |t|
      t.integer :spring_place_id
      t.integer :category_id
      t.string :quality_name
      t.string :old_quality_name
      t.float :temperature
      t.float :pH
      t.integer :osmotic_id
      t.float :discharge
      t.float :metasilicic_acid
      t.string :remarks
    end
  end
end
