class StructuresController < ApplicationController
  before_action :set_variables

  def index
    @structures = Structure.all
  end

  def show
    @structure = Structure.find(params[:id])
    @structure_type = StructureType.find(@structure.structure_type_id)
    @structure_classification = StructureClassification.find(@structure.structure_classification_id)
  end

  def new
  end

  def create
    @structure = Structure.create(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], telephone: params[:telephone], email: params[:email], website: params[:website], facebook: params[:facebook], twitter: params[:twitter], instagram: params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes])
    redirect_to structure_path(@structure.id)
  end

  def edit
    @structure = Structure.find(params[:id])
    @selected_structure_type = [StructureType.find(@structure.structure_type_id).name, @structure.structure_type_id]
    @selected_structure_classification = [StructureClassification.find(@structure.structure_classification_id).name, @structure.structure_classification_id]
  end

  def update
    @structure = Structure.find(params[:id])
    if params[:status] == "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], telephone: params[:telephone], email: params[:email], website: params[:website], facebook: params[:facebook], twitter: params[:twitter], instagram: params[:instagram], creation: params[:creation], staff_number: params[:staff_number], notes: params[:notes])
    else
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], telephone: params[:telephone], email: params[:email], website: params[:website], facebook: params[:facebook], twitter: params[:twitter], instagram: params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes])
    end
    redirect_to structure_path(@structure.id)
  end

  def destroy
    @structure = Structure.find(params[:id])
    @structure.destroy
    redirect_to root_path
  end

  private

  def set_variables
    @structure_types = []
    StructureType.all.each do |structure_type|
      @structure_types << [structure_type.name, structure_type.id]
    end

    @structure_classifications = []
    StructureClassification.all.each do |structure_classification|
      @structure_classifications << [structure_classification.name, structure_classification.id]
    end
  end
end
