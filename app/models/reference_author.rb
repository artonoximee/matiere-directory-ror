class ReferenceAuthor < ApplicationRecord
	belongs_to :reference 
	belongs_to :author
end
