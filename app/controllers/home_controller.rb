class HomeController < ApplicationController

	# skip_before_filter :authenticate_user!, :only => :index
	# layout 'home_layout', only: [:index]

	def index
			
		# puts current_user.inspect
		@user = User.find(current_user.id)
		puts @user.inspect

	end

end
