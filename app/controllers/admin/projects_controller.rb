class Admin::ProjectsController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
	end

	def create
		project = Project.create(title: params[:title], description: params[:description], website: "http://" + params[:website], status: params[:status], year: params[:year], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], notes: params[:notes])
		redirect_to project_path(project.id)
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		project = Project.find(params[:id])
		if params[:status] == "3"
			project.update(title: params[:title], description: params[:description], website: "http://" + params[:website], year: params[:year], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], notes: params[:notes])
		else
			project.update(title: params[:title], description: params[:description], website: "http://" + params[:website], status: params[:status], year: params[:year], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], notes: params[:notes])
		end
		project.get_lat_lng
		redirect_to project_path(project.id)
	end

	def destroy
		project = Project.find(params[:id])
		project.destroy
		redirect_to projects_path
	end
end
