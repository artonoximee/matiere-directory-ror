class ProjectClass < ApplicationRecord
	has_many :project_project_classes
	has_many :projects, through: :project_project_classes
end
