class DropTableSpringInfos < ActiveRecord::Migration
  def change
    drop_table :spring_infos
  end
end
