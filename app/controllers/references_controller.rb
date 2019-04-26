class ReferencesController < ApplicationController

  def index
    if params[:search] == " " || params[:search] == ""
      @references = Reference.all.order("title ASC")
    elsif params[:search]
      @references = Reference.where('lower(title) LIKE ?', "%#{params[:search].downcase}%")
    else
      @references = Reference.all.order("title ASC")
    end
    @references_count = Reference.all.count
  end

  def show
    @reference = Reference.find(params[:id])
  end
  
end
