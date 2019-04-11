class Structure < ApplicationRecord
	belongs_to :structure_type
	belongs_to :structure_classification
	has_many :structure_persons
	has_many :persons, through: :structure_persons
end
