json.array!(@spring_infos) do |spring_info|
  json.extract! spring_info, :id, :area_id, :name, :category_id, :quality_name, :old_quality_name, :temperature, :pH, :osmotic_id, :discharge, :place, :transportation, :metasilicic_acid, :remarks
  json.url spring_info_url(spring_info, format: :json)
end
