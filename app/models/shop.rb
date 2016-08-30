class Shop < ApplicationRecord

	belongs_to :user
	belongs_to :service_type
	belongs_to :location
	has_many :offers
	has_many :services
	has_many :carts
	
end
