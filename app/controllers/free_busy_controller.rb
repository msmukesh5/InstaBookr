include ApplicationHelper
class FreeBusyController < ApplicationController

	def index

		@shop = Shop.find(params[:id])
		@services = @shop.services
		
	end

	def add

		@shop = Shop.find(params[:shop_id])
		@service = Service.find(params[:service_id])
		@free_busy = FreeBusy.new
		
	end

	def create
		@free_busy = FreeBusy.new(new_free_busy_params)
		@free_busy.uuid = gen_uuid
		if @free_busy.save
       		flash[:notice] = "Saved Successfully"
       		redirect_to(:controller => 'free_busy',:action => 'index', :id => params[:shop_id])
    	else
       		flash[:notice] = "Save Unsuccessful"
       		render('add')
    	end
		
	end

	def edit

		@shop = Shop.find(params[:shop_id])
		@service = Service.find(params[:service_id])
		@free_busy = @service.free_busy

	end

	def update
		@free_busy = FreeBusy.find(params[:id])
		if @free_busy.update_attributes(new_free_busy_params)
			flash[:notice] = "Saved Successfully"
       		redirect_to(:controller => 'free_busy',:action => 'index', :id => params[:shop_id])
    	else
       		flash[:notice] = "Save Unsuccessful"
       		render('edit')
		end
		
	end

	def delete
		redirect_to root_path
	end

	def destroy
		
	end

	private

		def new_free_busy_params
		    params.require(:free_busy).permit(:id,:uuid,:service_id,:time_slot_1,:time_slot_2,:time_slot_3,:time_slot_4,:time_slot_5,:time_slot_6,:time_slot_7, :time_slot_8, :time_slot_9,:time_slot_10,:time_slot_12, :time_slot_13, :time_slot_14, :time_slot_15, :time_slot_16, :time_slot_17, :time_slot_18, :time_slot_19, :time_slot_20, :time_slot_21, :time_slot_22, :time_slot_23, :time_slot_24)
		end


end
