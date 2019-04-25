class Project < ApplicationRecord
	has_many :project_project_classes
	has_many :project_classes, through: :project_project_classes

	enum status: {executed: "0", ongoing: "1", upcoming: "2"}

	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng
end
