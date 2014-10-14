json.array!(@osmotics) do |osmotic|
  json.extract! osmotic, :id, :name
  json.url osmotic_url(osmotic, format: :json)
end
