class ReferencesController < ApplicationController

  def index
    @references = Reference.all
  end

  def show
    @reference = Reference.find(params[:id])
  end
  
end
