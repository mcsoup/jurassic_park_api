json.array!(@dinosaurs) do |dinosaur|
  json.extract! dinosaur, :id, :name, :species, :diet
  json.url dinosaur_url(dinosaur, format: :json)
end
