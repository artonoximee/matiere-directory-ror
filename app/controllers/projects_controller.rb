class ProjectsController < ApplicationController
  before_action :set_variables

	def index
    @projects_count = Project.all.count

    @project_classes.insert(0, ["Tous les classifications de projets", 0])

    case 
      when (params[:search] == "" || params[:search] == " " || params[:search] == nil) && params[:project_class_id] == "0"
        @projects = Project.all.order("title ASC")

      when (params[:search] != "" || params[:search] != " ") && params[:project_class_id] == "0"
        @projects = Project.where('lower(title) LIKE ?', "%#{params[:search].downcase}%") + Project.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")

      when (params[:search] == "" || params[:search] == " " || params[:search] == nil) && params[:project_class_id] != "0"
        @projects = []
        Project.all.each do |project|
          project.project_classes.each do |project_class|
            if project_class.id == params[:project_class_id].to_i
              @projects << project
            end
          end
        end

      when (params[:search] != "" || params[:search] != " " || params[:search] != nil) && params[:project_class_id] != "0"
        @projects_search = Project.where('lower(title) LIKE ?', "%#{params[:search].downcase}%") + Project.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")
        @projects = []
        @projects_search.each do |project|
          project.project_classes.each do |project_class|
            if project_class.id == params[:project_class_id].to_i
              @projects << project
            end
          end
        end

      else
        @projects = Project.all.order("title ASC")
    end

    if params[:project_class_id].to_i != 0
      @project_class = ProjectClass.find(params[:project_class_id].to_i)
      @selected_project_class = [@project_class.name, @project_class.id]
    end
    
	end

	def show
		@project = Project.find(params[:id])
	end

	def map
  	@projects = Project.all.order("title ASC")
  end

  private

  def set_variables
    @project_classes = []
    ProjectClass.all.each do |project_class|
      @project_classes << [project_class.name, project_class.id]
    end
  end

end
