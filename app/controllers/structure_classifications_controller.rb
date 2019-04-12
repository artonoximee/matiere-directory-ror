class StructureClassificationsController < ApplicationController
  def new
    @structure_classifications = StructureClassification.all
  end

  def create
    @classification = StructureClassification.create(name: params[:name])
    redirect_to new_structure_classification_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
