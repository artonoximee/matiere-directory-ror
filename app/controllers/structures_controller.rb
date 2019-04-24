class StructuresController < ApplicationController

  def index
    @structures = Structure.all.order("name ASC")
  end

  def show
    @structure = Structure.find(params[:id])
    @structure_type = StructureType.find(@structure.structure_type_id)
    @structure_classification = StructureClassification.find(@structure.structure_classification_id)
  end
end
