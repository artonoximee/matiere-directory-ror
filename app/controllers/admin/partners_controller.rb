class Admin::PartnersController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@partners = Partner.all.order("name ASC")
	end

	def create
		Partner.create(name: params[:name])
    redirect_to new_admin_partner_path
	end

	def edit
		@partner = Partner.find(params[:id])
	end

	def update
		partner = Partner.find(params[:id])
    partner.update(name: params[:name])
    redirect_to new_admin_partner_path
	end

	def destroy
		partner = Partner.find(params[:id])
    partner.destroy
    redirect_to new_admin_partner_path
	end
end
