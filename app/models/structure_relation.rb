class StructureRelation < ApplicationRecord
	belongs_to :supported, class_name: "Structure"
	belongs_to :supporting, class_name: "Structure"
end
