class CreateOsmotics < ActiveRecord::Migration
  def change
    create_table :osmotics do |t|
      t.string :name

      t.timestamps
    end
  end
end
