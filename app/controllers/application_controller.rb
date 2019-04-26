class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
  	admin_structures_path
	end

	private

	def is_admin
    unless user_signed_in? && current_user.admin == true
      redirect_to root_path
    end
  end
end
