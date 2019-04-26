class ProjectsController < ApplicationController
	def index
		if params[:search] == " " || params[:search] == ""
      @projects = Project.all.order("title ASC")
    elsif params[:search]
      @projects = Project.where('lower(title) LIKE ?', "%#{params[:search].downcase}%") + Structure.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")
    else
      @projects = Project.all.order("title ASC")
    end
    @projects_count = Project.all.count
	end

	def show
		@project = Project.find(params[:id])
	end

	def map
  	@projects = Project.all.order("title ASC")
  end
end
