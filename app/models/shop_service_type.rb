class ShopServiceType < ApplicationRecord

	has_many :services
	belongs_to :service_type

end
