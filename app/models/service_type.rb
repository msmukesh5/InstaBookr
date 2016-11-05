class ServiceType < ApplicationRecord

	has_many :shops
	has_many :services

end
