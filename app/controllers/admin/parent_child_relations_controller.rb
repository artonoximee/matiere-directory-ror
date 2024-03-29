class Admin::ParentChildRelationsController < ApplicationController
  before_action :is_admin, only: [:new, :create, :destroy]

  def new
    @parent_child_relations = ParentChildRelation.all.order("updated_at DESC")

  	@structures = []
    Structure.all.order("name ASC").each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
  	@parent_child_relation = ParentChildRelation.create(parent_id: params[:parent], child_id: params[:child])
  	redirect_to new_admin_parent_child_relation_path
  end

  def destroy
  	@parent_child_relation = ParentChildRelation.find(params[:id])
  	@parent_child_relation.destroy
  	redirect_to new_admin_parent_child_relation_path
  end
end