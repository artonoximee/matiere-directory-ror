class ReferencesController < ApplicationController

  def index
    @references = Reference.all
  end

  def show
    @reference = Reference.find(params[:id])
  end

  def create
    reference = Reference.create(title: params[:title], first_name: params[:first_name], last_name: params[:last_name], year: params[:year], editor: params[:editor], city: params[:city], country: params[:country], link: params[:link], notes: params[:notes])
    redirect_to reference_path(reference.id)
  end

  def new

  end

  def edit
    @reference = Reference.find(params[:id])
  end

  def update
    @reference = Reference.find(params[:id])
    @reference.update(title: params[:title], first_name: params[:first_name], last_name: params[:last_name], year: params[:year], editor: params[:editor], city: params[:city], country: params[:country], link: params[:link], notes: params[:notes])
    redirect_to reference_path(@reference.id)
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    redirect_to references_path
  end

end
