class IndividualsController < ApplicationController
  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find(params[:id])
    @count = @individual.structures.count
  end

  def new
    @structures = []
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end
  end

  def create
    individual = Individual.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], telephone: params[:telephone], linkedin: "http://" + params[:linkedin])
    StructureIndividual.create(structure_id: params[:structure_id], individual: individual)
    if params[:second_structure] == "1"
      StructureIndividual.create(structure_id: params[:structure_2_id], individual: individual)
    end
    redirect_to individual_path(individual.id)
  end

  def edit
    @individual = Individual.find(params[:id])
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], telephone: params[:telephone], linkedin: "http://" + params[:linkedin])
    redirect_to individual_path(@individual.id)
  end

  def destroy
    individual = Individual.find(params[:id])
    individual.destroy
    redirect_to individuals_path
  end
end
