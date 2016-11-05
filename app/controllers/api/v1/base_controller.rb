class Api::V1::BaseController < ApplicationController
	before_action :current_user
  	# after_filter :set_access_control_headers
    respond_to :json
	private
	# def set_access_control_headers
	#   headers['Access-Control-Allow-Origin'] = '*'
	#   headers['Access-Control-Request-Method'] = '*'
	# end

	def current_user
		if doorkeeper_token
	  		@current_user ||= User.find(doorkeeper_token.resource_owner_id)
		end
	end
end