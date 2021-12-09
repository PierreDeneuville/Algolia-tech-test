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
Movie.delete_all

puts "importing movies from Algolia JSON"

url = "https://gist.githubusercontent.com/alexandremeunier/49533eebe2ec93b14d32b2333272f9f8/raw/924d89e2236ca6fa2ade7481c91bfbf858c49531/movies.json"
movies_list = URI.open(url).read
movies = JSON.parse(movies_list)

puts "creating 5 first movies duuude"
movies.each do |movie|
  Movie.create(
    title: movie['title'],
    year: movie['year'].to_i,
    actors: movie['actors'].first(3),
    genre: movie['genre'].first(2),
    rating: movie['rating'],
    score: movie['score'],
    image: movie['image']
  )
  puts movie
end
