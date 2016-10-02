class Offer < ApplicationRecord
	
	belongs_to :shop
	belongs_to :service

	default_scope { where('end_date_time IS NOT NULL AND end_date_time > ? AND status = ?', DateTime.now,"Active")}

	
end
