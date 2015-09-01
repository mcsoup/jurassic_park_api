json.array!(@cages) do |cage|
  json.extract! cage, :id, :max_capacity, :power, :contained
  json.url cage_url(cage, format: :json)
end
