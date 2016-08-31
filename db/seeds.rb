# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ServiceType.find_or_create_by(name: 'Spa')
ServiceType.find_or_create_by(name: 'Gym')
ServiceType.find_or_create_by(name: 'Salon')
ServiceType.find_or_create_by(name: 'Sports Centre')

Location.find_or_create_by(location: 'New Town')
Location.find_or_create_by(location: 'Salt Lake')
Location.find_or_create_by(location: 'Sambalpur')