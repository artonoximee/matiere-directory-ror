class StructuresController < ApplicationController
  before_action :set_variables

  def index
    @structures_count = Structure.all.count
    @structures_types.insert(0, ["Tous les types de structures", 0])
    @structures_classifications.insert(0, ["Tous les classifications de structures", 0])

    case
      when (params[:search] == " " || params[:search] == "") && params[:structure_type_id] == "0" && params[:structure_classification_id] == "0"
        @structures = Structure.all.order("name ASC")

      when params[:search] && params[:structure_type_id] == "0" && params[:structure_classification_id] == "0"
        @structures = Structure.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") + Structure.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")

      when params[:search] && params[:search] != "" && params[:search] != " " && (params[:structure_type_id] != "0" || params[:structure_classification_id] != "0")
        @structures = []
        @structures_search = Structure.where('lower(name) LIKE ?', "%#{params[:search].downcase}%") + Structure.where('lower(city) LIKE ?', "%#{params[:search].downcase}%")
        
        if params[:structure_type_id] != "0" && params[:structure_classification_id] == "0"
          @structures_search.each do |structure|
            if structure.structure_type_id == params[:structure_type_id].to_i
              @structures << structure
            end
          end
        end
        
        if params[:structure_classification_id] != "0" && params[:structure_type_id] == "0"
          @structures_search.each do |structure|
            if structure.structure_classification_id == params[:structure_classification_id].to_i
              @structures << structure
            end
          end
        end

        if params[:structure_type_id] != "0" && params[:structure_classification_id] != "0"
          @structures_search_type = []
          @structures_search.each do |structure|
            if structure.structure_type_id == params[:structure_type_id].to_i
              @structures_search_type << structure
            end
          end
          @structures_search_type.each do |structure|
            if structure.structure_classification_id == params[:structure_classification_id].to_i
              @structures << structure
            end
          end
        end

      when (params[:search] == " " || params[:search] == "") && (params[:structure_type_id] != "0" || params[:structure_classification_id] != "0")
        @structures = []

        if params[:structure_type_id] != "0" && params[:structure_classification_id] == "0"
          Structure.all.each do |structure|
            if structure.structure_type_id == params[:structure_type_id].to_i
              @structures << structure
            end
          end
        end
        
        if params[:structure_classification_id] != "0" && params[:structure_type_id] == "0"
          Structure.all.each do |structure|
            if structure.structure_classification_id == params[:structure_classification_id].to_i
              @structures << structure
            end
          end
        end

        if params[:structure_type_id] != "0" && params[:structure_classification_id] != "0"
          @structures_search_type = []
          Structure.all.each do |structure|
            if structure.structure_type_id == params[:structure_type_id].to_i
              @structures_search_type << structure
            end
          end
          @structures_search_type.each do |structure|
            if structure.structure_classification_id == params[:structure_classification_id].to_i
              @structures << structure
            end
          end
        end
        
      else
         @structures = Structure.all.order("name ASC")
    end

    if params[:structure_type_id].to_i != 0
      @structure_type = StructureType.find(params[:structure_type_id].to_i)
      @selected_structures_type = [@structure_type.name, @structure_type.id]
    end

    if params[:structure_classification_id].to_i != 0
      @structure_classification = StructureClassification.find(params[:structure_classification_id].to_i)
      @selected_structures_classification = [@structure_classification.name, @structure_classification.id]
    end

  end

  def show
    @structure = Structure.find(params[:id])
    @structure_type = StructureType.find(@structure.structure_type_id)
    @structure_classification = StructureClassification.find(@structure.structure_classification_id)
  end

  def map
  	@structures = Structure.all.order("name ASC")
  end

  private

  def set_variables
    @structures_types = []
    StructureType.all.each do |structure_type|
      @structures_types << [structure_type.name, structure_type.id]
    end

    @structures_classifications = []
    StructureClassification.all.each do |structure_classification|
      @structures_classifications << [structure_classification.name, structure_classification.id]
    end
  end
end
