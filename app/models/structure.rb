class Structure < ApplicationRecord
	belongs_to :structure_type
	belongs_to :structure_classification
	has_many :structure_individuals
	has_many :individuals, through: :structure_individuals
end
