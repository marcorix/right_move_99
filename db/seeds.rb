puts "Cleaning DB"

Flat.destroy_all
User.destroy_all

puts "Creating Users"
user1 = User.create!(email: "marco@gmail.com", password: "123456", nickname: "marco")
user2 = User.create!(email: "giorgio@gmail.com", password: "123456", nickname: "giorgio")

puts "Creating Flats"
House.new(
  name: "The Beach Hut Gurnard",
  location: "Coastguard Cl, Normans Bay, Pevensey BN24 6PS",
  guests: 4,
  price: 246,
  house_type: "chalet",
  bedrooms: 2,
  user: user1
)
