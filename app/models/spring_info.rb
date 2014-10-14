class SpringInfo < ActiveRecord::Base
  belongs_to :spring_place, foreign_key: :spring_place_id
  belongs_to :category, foreign_key: :category_id
  belongs_to :osmotic, foreign_key: :osmotic_id

  def spring_place_str
    if self.spring_place
      self.spring_place.name
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

  def check_csv(csv_file)
    require 'csv'
    require 'kconv'

    @valid_message = {}
    spring_infos =[]
    valid = true
    # csvファイルを受け取って文字列にする
    csv_text = csv_file.read

    csv_text = CSV.parse(Kconv.toutf8(csv_text))

    # ファイルの中身を先にチェックするよ
    csv_text.shift  # 先頭行を無視するよ
    line_number = 2
    csv_text.each do |row|
        logger.debug(row)
        spring_info = SpringInfo.new
        spring_info.spring_place_id   = row[0].to_i
        spring_info.category_id       = row[1]
        spring_info.quality_name      = row[2]
        spring_info.old_quality_name  = row[3]
        spring_info.temperature       = row[4]
        spring_info.pH                = row[5]
        spring_info.osmotic_id        = row[6]
        spring_info.discharge         = row[7]
        spring_info.metasilicic_acid  = row[8]
        spring_info.remarks           = row[9]
        spring_info.save!
#        unless spring_info.valid?
#          valid = false
#        end
      line_number += 1
    end
    return valid, spring_infos
  end

end
