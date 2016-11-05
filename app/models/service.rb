class Service < ApplicationRecord

	belongs_to 	:shop
	belongs_to :shop_service_type
	has_one :free_busy
	has_many :offers
	has_many :carts
	has_many :bookings

end
