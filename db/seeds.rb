# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user = User.create! :first_name => 'Amanullah', :last_name => "Tanweer" :email => 'aman@intellecta.co', :password => 'asd123456_', :password_confirmation => 'asd123456_', :admin => true


User.create!(email: "aman@intellecta.co", first_name: "Amanullah", last_name: "Tanweer", company: "IA", address_line1: "AA112", address_line2: "", country: "Pakistan", state: "Sindh", city: "Karachi", zip: nil, phone: "03472065116", admin: true, role: 1, skype: "", linkedin: "", twitter: "", bio: nil, blocked: false, :password => 'asd123456_', :password_confirmation => 'asd123456_')
