class Reference < ApplicationRecord
	has_many :reference_authors
	has_many :authors, through: :reference_authors
end
