# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "cleaning movie base"
Movie.destroy_all

puts "importing movies from Algolia JSON"

url = "https://gist.github.com/alexandremeunier/49533eebe2ec93b14d32b2333272f9f8"
movies_list = URI.open(url).read
movies = JSON.parse(movies_list)

movies.first(5).each do |movie|
  puts movie
end
