class Admin::ReferencesController < ApplicationController
  before_action :set_variables
  before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @references = Reference.all
  end

  def show
    @reference = Reference.find(params[:id])
  end

  def create
    author = Author.create(first_name: params[:first_name], last_name: params[:last_name])
    reference = Reference.create(title: params[:title], year: params[:year], editor: params[:editor], city: params[:city], country: params[:country], link: "http://" + params[:link], summary: params[:summary], notes: params[:notes], reference_class_id: params[:reference_class_id])
    reference_author = ReferenceAuthor.create(reference_id: reference.id, author_id: author.id)

    if params[:second_author] == "1"
      second_author = Author.create(first_name: params[:second_first_name], last_name: params[:second_last_name])
      reference_second_author = ReferenceAuthor.create(reference_id: reference.id, author_id: second_author.id)
    end
    if params[:third_author] == "1"
      third_author = Author.create(first_name: params[:third_first_name], last_name: params[:third_last_name])
      reference_third_author = ReferenceAuthor.create(reference_id: reference.id, author_id: third_author.id)
    end
    if params[:fourth_author] == "1"
      fourth_author = Author.create(first_name: params[:fourth_first_name], last_name: params[:fourth_last_name])
      reference_fourth_author = ReferenceAuthor.create(reference_id: reference.id, author_id: fourth_author.id)
    end
    redirect_to reference_path(reference.id)
  end

  def new
  end

  def edit
    @reference = Reference.find(params[:id])
    @selected_reference_class = [ReferenceClass.find(@reference.reference_class_id).name, @reference.reference_class_id]
  end

  def update
    @reference = Reference.find(params[:id])
    @reference.update(title: params[:title], year: params[:year], editor: params[:editor], city: params[:city], country: params[:country], link: "http://" + params[:link], summary: params[:summary], notes: params[:notes], reference_class_id: params[:reference_class_id])
    i = 1
    @reference.authors.each do |author|
      first = "first_name" + i.to_s
      last = "last_name" + i.to_s
      author.update(first_name: params[first.to_sym], last_name: params[last.to_sym])
      i = i + 1
    end
    redirect_to reference_path(@reference.id)
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    redirect_to references_path
  end

  private

  def set_variables
    @reference_classes = []
    ReferenceClass.all.order("name ASC").each do |reference_class|
      @reference_classes << [reference_class.name, reference_class.id]
    end
  end

end
