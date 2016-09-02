class HomeController < ApplicationController

	# skip_before_filter :authenticate_user!, :only => :index
	layout 'home_layout'

	def index
			
		# puts current_user.inspect
		@user = User.find(current_user.id)
		puts @user.inspect

		if !@user.shops.blank?
			@shops = @user.shops.first
			@bookings = @shops.bookings
		end
		
	end


end
