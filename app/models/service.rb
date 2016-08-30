class Service < ApplicationRecord

	belongs_to 	:shop
	has_one :free_busy
	has_many :offers
	has_many :carts
	has_many :bookings

end
