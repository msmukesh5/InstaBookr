class HomeController < ApplicationController

	skip_before_filter :authenticate_user!, :only => :index
	layout 'home_layout', only: [:index]
	def index
		
	end

end
