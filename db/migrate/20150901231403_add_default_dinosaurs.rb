class AddDefaultDinosaurs < ActiveRecord::Migration
  def change
    {"Carnivore" => ['Tyrannosaurus', 'Velociraptor', 'Spinosaurus', 'Megalosaurus'],
     "Herbivore" => ['Brachiosaurus', 'Stegosaurus', 'Ankylosaurus', 'Triceratops']}.each do |k,v|
      v.map{|d| Species.create(diet: k, label: d)} 
    end
  end
end
