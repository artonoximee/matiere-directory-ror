class Admin::StructureRelationsController < ApplicationController
  before_action :is_admin, only: [:new, :create, :destroy]
  
  def new
    @structure_relations = StructureRelation.all.order("updated_at DESC")

    @structures = []
    Structure.all.order("name ASC").each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
    @structure_relation = StructureRelation.create(supported_id: params[:supported], supporting_id: params[:supporting])
    redirect_to new_admin_structure_relation_path
  end

  def destroy
    @structure_relation = StructureRelation.find(params[:id])
    @structure_relation.destroy
    redirect_to new_admin_structure_relation_path
  end
end
