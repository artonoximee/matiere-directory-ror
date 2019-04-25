class Admin::ProjectProjectClassesController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def create
		ProjectProjectClass.create(project_id: params[:project_id], project_class_id: params[:project_class_id])
		redirect_back(fallback_location: project_path(params[:project_id]))
	end

	def destroy
		project_project_class = ProjectProjectClass.find(params[:id])
		project_project_class.destroy
		redirect_back(fallback_location: projects_path)
	end
end
