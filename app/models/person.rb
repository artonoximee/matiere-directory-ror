class Person < ApplicationRecord
	has_many :structure_persons
	has_many :structures, through: :structure_persons
end
