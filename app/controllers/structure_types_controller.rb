class StructureTypesController < ApplicationController
	def new
		@structure_types = StructureType.all
	end

	def create
		@type = StructureType.create(name: params[:name])
		redirect_to new_structure_type_path
	end

	def edit
	end

	def update
	end

	def destroy
		@structure_type = StructureType.find(params[:id])
    @structure_type.destroy
    redirect_to new_structure_type_path
	end
end
