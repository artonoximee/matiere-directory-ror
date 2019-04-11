class Structure < ApplicationRecord
	belongs_to :structure_type
	belongs_to :structure_classification

	has_many :structure_individuals
	has_many :individuals, through: :structure_individuals

	has_many :parent_structures, foreign_key: "parent_id", class_name: "ParentChildRelation"
	has_many :child_structures, foreign_key: "child_id", class_name: "ParentChildRelation"

	has_many :supported_structures, foreign_key: "supported_id", class_name: "StructureRelation"
	has_many :supporting_structures, foreign_key: "supporting_id", class_name: "StructureRelation"

	has_one :association_detail

	enum status: {player: "0", partner: "1", both: "2"}
end
