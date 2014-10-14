json.array!(@prefectures) do |prefecture|
  json.extract! prefecture, :id, :name
  json.url prefecture_url(prefecture, format: :json)
end
