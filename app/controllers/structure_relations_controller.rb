class StructureRelationsController < ApplicationController
  def new
    @structures = []
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
    @structure_relation = StructureRelation.create(supported_id: params[:supported], supporting_id: params[:supporting])
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
