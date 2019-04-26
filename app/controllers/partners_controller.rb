class PartnersController < ApplicationController
	def index
		@partners = Partner.all.order("name ASC")
	end
end
