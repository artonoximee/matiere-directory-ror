class Admin::StructureTypesController < ApplicationController
	before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]
	
	def new
		@structure_types = StructureType.all
	end

	def create
		@type = StructureType.create(name: params[:name])
		redirect_to new_structure_type_path
	end

	def edit
		@structure_type = StructureType.find(params[:id])
	end

	def update
		@structure_type = StructureType.find(params[:id])
		@structure_type.update(name: params[:name])
		redirect_to new_structure_type_path
	end

	def destroy
	@structure_type = StructureType.find(params[:id])
	@structure_type.structures.destroy_all
    @structure_type.destroy
    redirect_to new_structure_type_path
	end
end