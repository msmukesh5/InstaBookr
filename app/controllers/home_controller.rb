include ApplicationHelper
class HomeController < ApplicationController

	# skip_before_filter :authenticate_user!, :only => :index
	layout 'home_layout'

	def index
			
		if !current_user.is_first_logged_in
			user_init_config(current_user.id)
		end
		# puts current_user.inspect
		@user = User.find(current_user.id)
		puts @user.inspect

		if !@user.shops.blank?
			@shops = @user.shops.last
			@bookings = @shops.bookings
		end
		
	end


end
