class Api::V1::Account::UsersController < Api::V1::BaseController

	skip_before_action :verify_authenticity_token, only: [:get_shops_list]

	def user_details

		begin
			user = current_user
			render :json => {:data => user, :success => true, :message => "User Found"}
		
		rescue Exception => e
			render :json => {:data => "", :success => false, :message => "Unable to retrive data"}
		end
	end

	def app_data

		begin
			shop_service_type = ShopServiceType.all
			render :json => {:data => {"shop_service_type" => shop_service_type.as_json, "service_type" => ServiceType.all.as_json}.as_json, :success => true, :message => "App Data found"}

		rescue Exception => e
			render :json => {:data => "", :success => false, :message => "Unable to retrive data"}
		end
	end

	# this shall have list of shops with the the params service
	# with cost of each service in that shop
	def get_shops_list

		begin
			res = []
			cost = 0
			offer_cost = 0

			Service.where(:shop_service_type_id => params[:shop_service_type_id]).each do |s|
				puts s.inspect
				puts params.inspect
				if s.shop.location_id == params[:location_id].to_i
					

					if s.offers.blank?
						puts "no offers"
						puts s.inspect
						case params[:membership_type].to_s
						when 'y'
							cost = s.cost_yearly
						when 'h'
							cost = s.cost_halfyearly

						when 'q'
							cost = s.cost_quartly

						when 'm'
							cost = s.cost_monthly

						when 'd'
							cost = s.cost_daily

						else 
							cost = 0
							
						end
					else
						puts "has offer"
						puts s.offers.inspect
						case params[:membership_type].to_s
						when 'y'
							cost = s.cost_yearly
							offer_cost = s.offers.last.cost_yearly
						when 'h'
							cost = s.cost_halfyearly
							offer_cost = s.offers.last.cost_halfyearly
						when 'q'
							cost = s.cost_quartly
							offer_cost = s.offers.last.cost_quartly
						when 'm'
							cost = s.cost_monthly
							offer_cost = s.offers.last.cost_monthly
						when 'd'
							cost = s.cost_daily
							offer_cost = s.offers.last.cost_daily
						else 
							cost = 0
							
						end

					end

					json_obj = { "shop_id" => s.shop_id,
						"shop_name" => s.shop.name,
						"icon" => s.shop.icon,
						"time_slot_ids" => s.shop.time_slot_ids,
						"day_slot_ids" => s.shop.day_slot_ids,
						"service_name" => s.shop_service_type.name,
						"cost" => cost,
						"offer_cost" => offer_cost
					}
					puts "json obj "+json_obj.to_s
					res << json_obj
					puts res

				end

				
			end





			render :json => {:data => res.as_json,:success => true, :message => "App Data found"}

		rescue Exception => e
			puts e.inspect
			render :json => {:data => "", :success => false, :message => "Unable to retrive data"}
		end	
	end

	

end