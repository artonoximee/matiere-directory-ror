class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end

	def show
		@project = Project.find(params[:id])
	end

	def map
  	@projects = Project.all.order("title ASC")
  end
end
