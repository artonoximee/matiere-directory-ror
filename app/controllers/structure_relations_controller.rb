class StructureRelationsController < ApplicationController
  def index
    @structure_relations = StructureRelation.all
  end
end
