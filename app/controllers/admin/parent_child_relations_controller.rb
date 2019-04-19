class Admin::ParentChildRelationsController < ApplicationController
  before_action :is_admin, only: [:new, :create, :destroy]

  def index
  	@parent_child_relations = ParentChildRelation.all
  end

  def new
  	@structures = []
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
  	@parent_child_relation = ParentChildRelation.create(parent_id: params[:parent], child_id: params[:child])
  	redirect_to parent_child_relations_path
  end

  def destroy
  	@parent_child_relation = ParentChildRelation.find(params[:id])
  	@parent_child_relation.destroy
  	redirect_to parent_child_relations_path
  end
end