class Cart < ApplicationRecord

	belongs_to :user
	belongs_to :service
	belongs_to :shop

end
