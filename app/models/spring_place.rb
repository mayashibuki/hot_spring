class SpringPlace < ActiveRecord::Base
  belongs_to :area, foreign_key: :area_id

  def area_str
    if self.area
      self.area.name
    end
  end

end
