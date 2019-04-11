class ParentChildRelation < ApplicationRecord
	belongs_to :parent, class_name: "Structure"
	belongs_to :child, class_name: "Structure"
end
