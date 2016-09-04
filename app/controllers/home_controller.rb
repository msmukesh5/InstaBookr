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
		if @user.is_super_user

			@shops = Shop.all
			puts @shops.inspect

		elsif @user.is_owner
			if !@user.shops.blank?
				@shops = @user.shops.first
				@bookings = @shops.bookings
			end
		else
			flash[:notice] = "For Bookings, please login through our Application"
		end
			
		
	end


end
