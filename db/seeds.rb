# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# use JSON Formatter to display JSON nicely in your browser
require "json"
require "open-uri"

puts "Cleaning up database..."
Movie.destroy_all
puts "Database cleaned"

url = "http://tmdb.lewagon.com/movie/top_rated"

10.times do |i|
  puts "Importing movies from page #{i + 1}"
  movie_serialized = URI.open("#{url}?page=#{i + 1}".read)
  movies = JSON.parse(movie_serialized)['results']
  movies.each do |movie|
    puts "Creating #{movie['title']}"
    base_poster_url = "https://image.tmdb.org/t/p/original"
    Movie.create(
      title: movie["title"],
      overview: movie["overview"],
      poster_url: "#{base_poster_url}#{movie["backdrop_path"]}",
      rating: movie["vote_average"]
    )
  end
end

puts "Movie created"
