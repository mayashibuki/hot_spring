class Area < ActiveRecord::Base
  belongs_to :prefecture, foreign_key: :prefecture_id

  def prefecture_str
    if self.prefecture
      self.prefecture.name
    end
  end

end
