json.array!(@classifields) do |classifield|
  json.extract! classifield, :id, :address, :latitude, :longitude
  json.url classifield_url(classifield, format: :json)
end
