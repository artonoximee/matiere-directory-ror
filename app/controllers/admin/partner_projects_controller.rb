class Admin::PartnerProjectsController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def create
		PartnerProject.create(project_id: params[:project_id], partner_id: params[:partner_id])
		redirect_back(fallback_location: project_path(params[:project_id]))
	end

	def destroy
		partner_project = PartnerProject.find(params[:id])
		partner_project.destroy
		redirect_back(fallback_location: projects_path(params[:project_id]))
	end
end