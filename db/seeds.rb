# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.where(email: "msmukesh4+super_admin@gmail.com").first
if admin.blank?
	User.create! :first_name => 'Super', :last_name => 'Admin',:gender => "male", :email=>'msmukesh4+super_admin@gmail.com', :password => 'Instabookr@admin123', :password_confirmation => 'Instabookr@admin123', :confirmed_at => Time.now, :contact_number1 => '9040357009', :status => 'Active', is_super_user: true
end
owner = User.where(email: "msmukesh4+owner@gmail.com").first
if admin.blank?
	User.create! :first_name => 'Shop', :last_name => 'Demo Owner', :email=>'msmukesh4+owner@gmail.com', :password => 'Instabookr@owner123', :password_confirmation => 'Instabookr@owner123', :confirmed_at => Time.now, :contact_number1 => '9040357009', :status => 'Active', is_owner: true
end

ServiceType.find_or_create_by(name: 'Spa')
ServiceType.find_or_create_by(name: 'Gym')
ServiceType.find_or_create_by(name: 'Salon')
ServiceType.find_or_create_by(name: 'Sports Centre')

Location.find_or_create_by(location: 'New Town')
Location.find_or_create_by(location: 'Salt Lake')
Location.find_or_create_by(location: 'Sambalpur')

shop = Shop.where(:uuid => "12345678900987654321").first
if shop.blank?
	Shop.create! :name => "Bajrangi Gym", :user_id => User.find_by_email("msmukesh4+owner@gmail.com").id, :service_type_id => ServiceType.find_by_name("Gym").id, :uuid => "12345678900987654321", :time_slot_ids => "[8,9,10,11,12]", :day_slot_ids => "[1,2,3,4,5,6]", :status => "Active", :contact_number1 => '9876543210', :location_id => Location.find_by_location('New Town').id, :caption => "demo caption", :details => "demo details", :address => "demo address"
end
# shop = Shop.where(:uuid => "12345678900987654322").first
# if shop.blank?
# 	Shop.create! :name => "Bajrangi Spa", :user_id => User.find_by_email("msmukesh4+owner@gmail.com").id, :service_type_id => ServiceType.find_by_name("Spa").id, :uuid => "12345678900987654322", :time_slot_ids => "[8,9,10,11,12]", :day_slot_ids => "[1,2,3,4,5,6]", :status => "UNCONFIRMED", :contact_number1 => '9876543210', :location_id => Location.find_by_location('New Town').id, :caption => "demo caption", :details => "demo details", :address => "demo address"
# end


Service.create! :uuid => "12345678900987655321", :shop_id => Shop.find_by_uuid("12345678900987654321").id, :name => 'Gym', :cost_daily => 100, :cost_monthly => 2000, :cost_quartly => 20000, :status => 'Active'


booking = Booking.where(:uuid => "b6f5f99c3cd867528568").first
if booking.blank?
	Booking.create! :uuid => "b6f5f99c3cd867528568",:user_id => User.find_by_email("msmukesh4+super_admin@gmail.com").id ,:shop_id => Shop.find_by_uuid("12345678900987654321").id, :service_id => Service.find_by_uuid("12345678900987655321").id, :time_slots => "[9]", :booking_token => "90a1945df412639b99989b3e33615f3a969e4bba", :cost => Service.find_by_uuid("12345678900987655321").cost_daily, :date => DateTime.now+1.day
end
