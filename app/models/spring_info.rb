class SpringInfo < ActiveRecord::Base
  belongs_to :area, foreign_key: :area_id
  belongs_to :category, foreign_key: :category_id
  belongs_to :osmotic, foreign_key: :osmotic_id

  def area_str
    if self.area
      self.area.name
    end
  end

  def category_str
    if self.category
      self.category.name
    end
  end

  def osmotic_str
    if self.osmotic
      self.osmotic.name
    end
  end

end
