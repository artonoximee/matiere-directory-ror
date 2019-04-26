class PartnersController < ApplicationController
	def index
		if params[:search] == " " || params[:search] == ""
      @partners = Partner.all.order("name ASC")
    elsif params[:search]
      @partners = Partner.where('lower(name) LIKE ?', "%#{params[:search].downcase}%")
    else
      @partners = Partner.all.order("name ASC")
    end
    @partners_count = Partner.all.count
	end
end
