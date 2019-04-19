class ApplicationController < ActionController::Base

	private

	def is_admin
    unless user_signed_in? && current_user.admin == true
      redirect_to root_path
    end
  end
end
