puts "Cleaning DB"

Flat.destroy_all
User.destroy_all

puts "Creating Users"
user1 = User.create!(email: "marco@gmail.com", password: "123456", nickname: "marco")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456", nickname: "giorgio")

puts "Creating Flats"
flat1 = Flat.new(
  name: "The Beach Hut Gurnard",
  address: "Coastguard Cl, Normans Bay, Pevensey BN24 6PS",
  guests: 4,
  price: 246,
  property_type: "chalet",
  user: user1
)
flat1.save!

flat2 = Flat.new(
  name: "Ocean View - Bracklesham Bay",
  address: "Venton Rd, Carbis Bay, Saint Ives TR26 2AQ",
  guests: 6,
  price: 440,
  property_type: "maisonette",
  user: user2
)
flat2.save!

puts "Created #{Flat.count} flats"
