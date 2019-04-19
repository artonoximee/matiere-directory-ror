class Author < ApplicationRecord
	has_many :reference_authors
	has_many :references, through: :reference_authors
end
