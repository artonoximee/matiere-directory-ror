class ParentChildRelationsController < ApplicationController
  def index
  	@parent_child_relations = ParentChildRelation.all
  end
end