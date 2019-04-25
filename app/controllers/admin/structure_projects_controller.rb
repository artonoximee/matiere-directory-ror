class Admin::StructureProjectsController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def create
		StructureProject.create(project_id: params[:project_id], structure_id: params[:structure_id])
		redirect_back(fallback_location: project_path(params[:project_id]))
	end

	def destroy
		structure_project = StructureProject.find(params[:id])
		structure_project.destroy
		redirect_back(fallback_location: projects_path)
	end
end