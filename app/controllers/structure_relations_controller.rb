class StructureRelationsController < ApplicationController
  def index
    @structure_relations = StructureRelation.all
  end
  def new
    @structures = []
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
    @structure_relation = StructureRelation.create(supported_id: params[:supported], supporting_id: params[:supporting])
    redirect_to structure_relations_path
  end

  def destroy
    @structure_relation = StructureRelation.find(params[:id])
    @structure_relation.destroy
    redirect_to structure_relations_path
  end
end
