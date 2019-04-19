class IndividualsController < ApplicationController

  def index
    @individuals = Individual.all
  end

  def show
    @individual = Individual.find(params[:id])
    @count = @individual.structures.count
  end

end
