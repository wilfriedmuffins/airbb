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
    t.title = row['title'].to_s
    t.adresse = row['adresse'].to_s
    t.start_date_of_availability = row['start_date_of_availability'].to_d
    t.end_date_of_availability = row['end_date_of_availability'].date
    t.voyageur = row['voyageur'].to_i
    t.created_at = row['created_at'].datetime
    t.updated_at = row['updated_at'].datetime
    t.city = row['city'].to_s
    t.latitude = row['latitude'].float
    t.longitude = row['longitude'].float
    t.user_id = row['user_id'].bigint
    t.images = row['images'].to_s
    t.bookings_count = row['bookings_count'].to_i
    t.comments_count = row['comments_count'].to_i
    t.price = row['price'].to_i
    t.description = row['description'].to_s
    t.equipments = row['equipments'].split(" ").to_s
    t.save
    puts "#{t.title} saved"
end

puts "There are now #{Logement.count} rows in the transactions table"