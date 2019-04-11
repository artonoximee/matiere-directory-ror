class Individual < ApplicationRecord
	has_many :structure_individuals
	has_many :structures, through: :structure_individuals
end