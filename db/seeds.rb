# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
 puts "Getting rid of the movies"
  @movie = Movie.destroy_all

 puts "generating movies..."
10.times do
  movie = Movie.new(
    title: Faker::Movie.title,
    overview: Faker::Quote.yoda,
    poster_url: Faker::Internet.url,
    rating: (0..5).to_a.sample
  )
  puts "#{movie.title} was created" if movie.save!

end
