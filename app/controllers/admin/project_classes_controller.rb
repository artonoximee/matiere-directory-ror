class Admin::ProjectClassesController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def new
		@project_classes = ProjectClass.all.order("name ASC")
	end

	def create
		project_class = ProjectClass.create(name: params[:name])
    redirect_to new_admin_project_class_path
	end

	def edit
		@project_class = ProjectClass.find(params[:id])
	end

	def update
		@project_class = ProjectClass.find(params[:id])
    @project_class.update(name: params[:name])
    redirect_to new_admin_project_class_path
	end

	def destroy
		@project_class = ProjectClass.find(params[:id])
    @project_class.destroy
    redirect_to new_admin_project_class_path
	end
end
