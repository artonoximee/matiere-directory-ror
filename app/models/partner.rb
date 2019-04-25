class Partner < ApplicationRecord
	has_many :structure_partners
	has_many :structures, through: :structure_partners

	has_many :partner_projects
	has_many :projects, through: :partner_projects
end
