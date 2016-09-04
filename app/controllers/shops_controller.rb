class ShopsController < ApplicationController

	def index

		if !current_user.shops.empty?
			@shops = current_user.shops
		end
	end

	def edit
		@shop = Shop.find(params[:shop_id])
		@user = User.find(current_user.id)
	end

	def show
		@shop = Shop.find(params[:id])
	end

	def update
		@shop = Shop.find(params[:id])
		if @shop.update_attributes(new_shop_params)
        	flash[:notice] = "Shop updated successfully"
			redirect_to(:action => 'index', :id => @shop.id)
		end
	end

	def new
		@user = User.find(current_user.id)
		@user.is_owner = true if !@user.is_owner
		@user.save
		puts @user.inspect

		@shop = Shop.new
	end

	def confirm
		@user = User.find(current_user.id)
		puts @user.inspect
		@shop = Shop.find(params[:shop_id])
		@confirmation = params[:confirmation]
		if !@user.is_super_user
			flash[:notice] = "You dont have privilege to confirm/unconfirm a shop"
			redirect_to(:controller => 'home', :action => 'index')
		end
	end

	def toggle_confirmation
		shop = Shop.find(params[:shop_id])
		puts shop.inspect
		puts params.inspect
		if params[:confirmation]
			shop.status = "Active"
			shop.save
		else
			shop.status = "UNCONFIRMED"
			shop.save
		end
		redirect_to(:controller => 'home', :action => 'index')
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

  	def delete
    	@shop = Shop.find(params[:id])
  	end

  	def destroy
    	shop = Shop.find(params[:id])
    	shop.status = "DEACTIVE"
    	shop.save
    	flash[:notice] = "shop #{shop.name} destroyed successfully"
    	redirect_to(:action => 'index')
  	end



  	private
	    def new_shop_params
	      	params.require(:shop).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_id, :time_slot_ids, :day_slot_ids, :contact_number1, :contact_number2,:location_id,:latitude, :logitude, :caption, :details, :address)
	    end

end
