class Admin::ProjectsController < ApplicationController
	before_action :set_variables
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
	end

	def create
		project = Project.create(title: params[:title], description: params[:description], website: "http://" + params[:website], status: params[:status], year: params[:year], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], notes: params[:notes])
		ProjectProjectClass.create(project: project, project_class_id: params[:project_class_id])
		if params[:second_class] == "1"
			ProjectProjectClass.create(project: project, project_class_id: params[:second_project_class_id])
		end
		if params[:third_class] == "1"
			ProjectProjectClass.create(project: project, project_class_id: params[:third_project_class_id])
		end
		if params[:add_partner] == "1"
			PartnerProject.create(project: project, partner_id: params[:partner_id])
		end
		if params[:second_partner] == "1"
			PartnerProject.create(project: project, partner_id: params[:second_partner_id])
		end
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

	private

  def set_variables
    @project_classes = []
    ProjectClass.all.order("name ASC").each do |project_class|
      @project_classes << [project_class.name, project_class.id]
    end

    @partners = []
    Partner.all.order("name ASC").each do |partner|
      @partners << [partner.name, partner.id]
    end
  end

end
