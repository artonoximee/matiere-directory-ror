class PartnerProject < ApplicationRecord
	belongs_to :partner 
	belongs_to :project
end
