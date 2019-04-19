class StructureTypesController < ApplicationController
	def new
		@structure_types = StructureType.all
	end
end