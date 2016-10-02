include ApplicationHelper
class ShopsController < ApplicationController

	def index

		if !current_user.shops.empty?
			@shops = current_user.shops.where(:status => 'Active')
      if @shops.empty?
          flash[:notice] = "your shop is not active yet !!!"
          redirect_to(:controller => 'home', :action => 'index')
      end
		end
	end

	def edit
		@shop = Shop.find(params[:shop_id])
		@user = User.find(current_user.id)
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

	def create
    	@shop = Shop.new(new_shop_params)
    	@shop.uuid = gen_uuid
    	@shop.user_id = current_user.id
    	if @shop.save
       		flash[:notice] = "Shop successfully created"
       		redirect_to(:controller => 'home',:action => 'index')
    	else
       		flash[:notice] = "Shop creation unsuccessful"
       		render('new')
    	end
  	end

  	def show
		@shop = Shop.find(params[:id])
	end

	def confirm
		@user = User.find(current_user.id)
		puts @user.inspect
		@shop = Shop.find(params[:shop_id])
		puts params.inspect
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
		if params[:confirmation] == "true"
			puts "activating"
			shop.status = "Active"
			shop.save
		else
			puts "deactivating"
			shop.status = "UNCONFIRMED"
			shop.save
		end
		redirect_to(:controller => 'home', :action => 'index')
	end

  	def delete
    	@shop = Shop.find(params[:id])
  	end

  	def destroy
    	shop = Shop.find(params[:id])
    	shop.status = "DEACTIVE"
    	shop.save
    	flash[:notice] = "shop #{shop.name} destroyed successfully"
    	redirect_to(:controller => 'home',:action => 'index')
  	end

  	def services
  		@shop = Shop.find(params[:shop_id])
  		@services = Service.where(:shop_id => params[:shop_id], :status => "Active")
  		puts @services.inspect
  	end

  	

  	def add_service
  		@service = Service.new
  		@shop = Shop.find(params[:shop_id])
  	end

  	def create_service
  		@service = Service.new(new_service_params)
  		@service.uuid = gen_uuid
  		if @service.save
       		flash[:notice] = "Service successfully created"
       		redirect_to(:controller => 'shops',:action => 'services', :shop_id => @service.shop_id)
    	else
       		flash[:notice] = "Service creation unsuccessful"
       		redirect_to(:action => 'add_service', :shop_id => current_user.shops.where(:status => 'Active').first)
    	end
  		
  	end

  	def edit_service
  		@service = Service.find(params[:service_id])
  		@shop = Shop.find(params[:shop_id])
  	end

  	def update_service
  		@service = Service.find(params[:id])
  		if @service.update_attributes(new_service_params)
  			flash[:notice] = "service updated successfully"
			redirect_to(:action => 'services', :shop_id => @service.shop_id)
  		end
  	end

  	
  	def delete_service
  		@service = Service.find(params[:service_id])
  		@shop = Shop.find(params[:shop_id])
  	end

  	def destroy_service
  		service = Service.find(params[:service_id])
    	service.status = "DEACTIVE"
    	service.save
    	flash[:notice] = "service #{service.name} destroyed successfully"
		  redirect_to(:action => 'services', :shop_id => params[:shop_id])
  	end



  	def add_offer
  		@shop = Shop.find(params[:shop_id])
      @service = Service.find(params[:service_id])
      @offer = Offer.new
  	end

  	def create_offer
  		@offer = Offer.new(new_offer_params)
      uuid = gen_uuid
      @offer.code = uuid[0...6]
      @offer.uuid = uuid
      if @offer.save
        flash[:notice] = "Offer successfully created"
        redirect_to(:controller => 'shops',:action => 'services', :shop_id => params[:shop_id])
      else
        flash[:notice] = "Offer adding failed"
        redirect_to(:controller => 'shops',:action => 'services', :shop_id => params[:shop_id])
      end

  	end

  	def edit_offer
  		@shop = Shop.find(params[:shop_id])
      @service = Service.find(params[:service_id])
      @offer = @service.offers.first
  	end

  	def update_offer
  		@offer = Offer.find(params[:id])
      if @offer.update_attributes(new_offer_params)
        flash[:notice] = "Offer updated successfully"
        redirect_to(:action => 'services', :shop_id => @offer.shop_id)
      else
        flash[:notice] = "Offer cannot be updated"
      end
  	end

  	def delete_offer
  		@offer = Offer.find(params[:offer_id])
  	end

  	def destroy_offer
  		offer = Offer.find(params[:offer_id])
      offer.status = "DEACTIVE"
      offer.save
      flash[:notice] = "Offer deleted successfuly"
      redirect_to(:action => 'services', :shop_id => offer.shop_id)
  	end




  	private
	    def new_shop_params
	      	params.require(:shop).permit(:id, :name, :user_id, :icon, :banner, :uuid, :service_type_id, :time_slot_ids, :day_slot_ids, :contact_number1, :contact_number2,:location_id,:latitude, :logitude, :caption, :details, :address)
	    end

	    def new_service_params
	    	params.require(:service).permit(:id,:name,:shop_id,:cost_daily,:cost_monthly,:cost_quartly,:cost_halfyearly,:cost_yearly)
	    end

      def new_offer_params
        params.require(:offer).permit(:id,:offer_name,:shop_id,:service_id,:cost_daily,:cost_monthly,:cost_quartly,:cost_halfyearly,:cost_yearly)
      end

end
