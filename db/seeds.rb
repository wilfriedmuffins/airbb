# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# #Reset counter cache
# Logement.all.each do |logement|
#     Logement.reset_counters(logement.id, :bookings_count)
#     Logement.reset_counters(logement.id, :comments_count)
# end

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'logement.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
    t = Logement.new
    t.title = row['title'].string
    t.adresse = row['adresse'].string
    t.start_date_of_availability = row['start_date_of_availability'].date
    t.end_date_of_availability = row['end_date_of_availability'].date
    t.voyageur = row['voyageur'].integer
    t.created_at = row['created_at'].datetime
    t.updated_at = row['updated_at'].datetime
    t.city = row['city'].string
    t.latitude = row['latitude'].float
    t.longitude = row['longitude'].float
    t.user_id = row['user_id'].bigint
    t.images = row['images'].string
    t.bookings_count = row['bookings_count'].integer
    t.comments_count = row['comments_count'].integer
    t.price = row['price'].integer
    t.description = row['description'].string
    t.equipments = row['equipments'].split(" ")
    t.save
    puts "#{t.title} saved"
end

puts "There are now #{Logement.count} rows in the transactions table"