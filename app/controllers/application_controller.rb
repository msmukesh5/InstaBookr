class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def gen_uuid
  	SecureRandom.hex(10)
  end

end
