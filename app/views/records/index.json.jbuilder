json.array!(@records) do |record|
  json.(record, :id, :content, :lat, :lng, :weather, :date, :user_id)
end
