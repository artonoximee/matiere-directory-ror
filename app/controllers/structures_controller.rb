class StructuresController < ApplicationController

  def index
    if params[:search]
      @structures = Structure.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") + Structure.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")
    else
      @structures = Structure.all.order("name ASC")
    end
    @structures_count = Structure.all.count
  end

  def show
    @structure = Structure.find(params[:id])
    @structure_type = StructureType.find(@structure.structure_type_id)
    @structure_classification = StructureClassification.find(@structure.structure_classification_id)
  end

  def map
  	@structures = Structure.all.order("name ASC")
  end
end
