json.array!(@spring_places) do |spring_place|
  json.extract! spring_place, :id, :area_id, :name, :place, :transportation
  json.url spring_place_url(spring_place, format: :json)
end
