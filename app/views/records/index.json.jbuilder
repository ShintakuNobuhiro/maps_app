json.array!(@records) do |record|
  json.(record, :content, :lat, :lng, :weather, :date)
end
