class IndividualsController < ApplicationController
  before_action :set_variables

  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find(params[:id])
    @count = @individual.structures.count
  end

  def new
  end

  def create
    individual = Individual.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], telephone: params[:telephone], linkedin: "http://" + params[:linkedin], profession: params[:profession], notes: params[:notes])
    if params[:structure_id] != 0
      StructureIndividual.create(structure_id: params[:structure_id], individual: individual)
    end
    if params[:second_structure] == "1"
      StructureIndividual.create(structure_id: params[:structure_2_id], individual: individual)
    end
    redirect_to individual_path(individual.id)
  end

  def edit
    @individual = Individual.find(params[:id])
    @selected_structures = []
    @individual.structures.each do |structure|
      @selected_structures << [structure.name, structure.id]
    end
  end

  def update
    @individual = Individual.find(params[:id])
    @individual.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], telephone: params[:telephone], linkedin: "http://" + params[:linkedin], profession: params[:profession], notes: params[:notes])
    case
      when @individual.structures != [] && params[:structure_id] == "0" && params[:structure_2_id] == "0"
        @individual.structure_individuals.destroy_all

      when @individual.structures.count == 1 && params[:structure_id] != "0" && params[:structure_2_id] != "0"
        @individual.structure_individuals[0].update(structure_id: params[:structure_id], individual: @individual)
        StructureIndividual.create(structure_id: params[:structure_2_id], individual: @individual)

      when @individual.structures != [] && params[:structure_id] != "0" && params[:structure_2_id] != "0"
        @individual.structure_individuals[0].update(structure_id: params[:structure_id], individual: @individual)
        @individual.structure_individuals[1].update(structure_id: params[:structure_2_id], individual: @individual)

      when @individual.structures != [] && params[:structure_id] == "0" && params[:structure_2_id] != "0"
        @individual.structure_individuals[0].destroy
        @individual.structure_individuals[1].update(structure_id: params[:structure_2_id], individual: @individual)

      when @individual.structures == 1 && params[:structure_id] != "0" && params[:structure_2_id] == "0"
        @individual.structure_individuals[0].update(structure_id: params[:structure_id], individual: @individual)

      when @individual.structures == [] && params[:structure_id] != "0"
        StructureIndividual.create(structure_id: params[:structure_id], individual: @individual)
    end
    redirect_to individual_path(@individual.id)
  end

  def destroy
    individual = Individual.find(params[:id])
    individual.structure_individuals.destroy_all
    individual.destroy
    redirect_to individuals_path
  end

  private

  def set_variables
    @structures = []
    @structures << ["Pas de structure associée", 0]
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end
  end
end
