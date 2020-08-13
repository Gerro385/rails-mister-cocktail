# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"


file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read


=begin serialized_ingredients = File.read(file)
ingredients = JSON.parse(serialized_ingredients)

ingredients.each do |ingredient|
  puts ingredient
end
p ingredients
=end

#URI.parse(file).class
parsed_file = JSON.parse(file)
#p parsed_file["drinks"]
ingredients = []
parsed_file["drinks"].each do |element|
   ingredients << element["strIngredient1"]
end

ingredients.each do |ingredient|
  new = Ingredient.create(name: ingredient)
  puts "Ingredient #{new.name} created"
end
puts "All Ingredients added"
