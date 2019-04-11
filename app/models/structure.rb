class Structure < ApplicationRecord
	belongs_to :structure_type
	belongs_to :structure_classification

	has_many :structure_individuals
	has_many :individuals, through: :structure_individuals

	has_many :parent_child_relations, foreign_key: "parent_id", class_name: "ParentChildRelation"
	has_many :parent_child_relations, foreign_key: "child_id", class_name: "ParentChildRelation"

	has_one :association_detail
end
