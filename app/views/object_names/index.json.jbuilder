json.array!(@object_names) do |object_name|
  json.extract! object_name, :id
  json.url object_name_url(object_name, format: :json)
end
