json.array! @items do |item|
  json.extract! item, :id, :name, :description
end
