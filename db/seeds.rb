# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'pokemon.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Pokemon.new
  t.name = row['Name']
  t.type_1 = row['Type 1']
  t.type_2 = row['Type 2']
  t.total = row['Total']
  t.hp = row['HP']
  t.attack = row['Attack']
  t.defense = row['Defense']
  t.sp_atk = row['Sp. Atk']
  t.sp_def = row['Sp. Def']
  t.speed = row['Speed']
  t.generation = row['Generation']
  t.legendary = row['Legendary'].to_s.downcase == "true"
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Pokemon.count} rows in the transactions table"
