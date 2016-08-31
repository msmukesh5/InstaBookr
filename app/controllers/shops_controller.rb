class ShopsController < ApplicationController

	def index

		if !current_user.shops.empty?
			@shops = current_user.shops
		else 
			redirect_to(:controller => 'home', :action => 'index')	
		end
		
	end

	def new
		# current_user.is_owner = true if current_user.is_owner = false
		# current_user.save
		# puts current_user.inspect
		@user = User.find(current_user.id)
		@user.is_owner = true if !@user.is_owner
		@user.save
		puts @user.inspect

		@shop = Shop.new
	end

	def create
    	@shop = Shop.new(new_shop_params)
    	@shop.uuid = gen_uuid
    	@shop.user_id = current_user.id
    	if @shop.save
       		flash[:notice] = "Shop successfully created"
       		redirect_to(:action => 'index')
    	else
       		flash[:notice] = "Shop creation unsuccessful"
       		render('new')
    	end
  	end

  	private
	    def new_shop_params
	      	params.require(:shop).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_id, :time_slot_ids, :day_slot_ids, :contact_number1, :contact_number2,:location_id,:latitude, :logitude, :caption, :details, :address)
	    end

end
