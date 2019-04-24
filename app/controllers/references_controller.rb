class ReferencesController < ApplicationController

  def index
    @references = Reference.all.order("title ASC")
  end

  def show
    @reference = Reference.find(params[:id])
  end
  
end
