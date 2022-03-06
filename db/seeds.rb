# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'san_francisco.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
    t = Logement.new
    t.id = row['id']
    t.title = row['title']
    t.adresse = row['adresse']
    t.start_date_of_availability = row['start_date_of_availability']
    t.end_date_of_availability = row['end_date_of_availability']
    t.voyageur = row['voyageur']
    t.created_at = row['created_at']
    t.updated_at = row['updated_at']
    t.city = row['city']
    t.zipcode = row['zipcode']
    t.latitude = row['latitude']
    t.longitude = row['longitude']
    t.user_id = row['user_id']
    t.images = row['images']
    t.bookings_count = row['bookings_count']
    t.comments_count = row['comments_count']
    t.price = row['price']
    t.description = row['description']
    t.equipments = row['equipments'].split(" ")
    t.save
    puts "#{t.title} saved"
end

puts "There are now #{Logement.count} rows in the transactions table"

#Reset counter cache
Logement.all.each do |logement|
    Logement.reset_counters(logement.id, :bookings_count)
    Logement.reset_counters(logement.id, :comments_count)
end