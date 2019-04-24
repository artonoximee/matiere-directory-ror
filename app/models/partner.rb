class Partner < ApplicationRecord
	has_many :structure_partners
	has_many :structures, through: :structure_partners
end
