class Structure < ApplicationRecord
	belongs_to :structure_type
	belongs_to :structure_classification
end
