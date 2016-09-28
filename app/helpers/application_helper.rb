module ApplicationHelper

	def user_init_config(user_id)
		u = User.find(user_id)
		u.is_first_logged_in = true
		u.uuid = gen_uuid
		u.save
	end

	def gen_uuid
  		SecureRandom.hex(10)
  	end

end
