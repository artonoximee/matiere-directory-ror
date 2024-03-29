class Admin::StructuresController < ApplicationController
  before_action :set_variables
  before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
    @structures = Structure.all.order("name ASC")
  end

  def show
    @structure = Structure.find(params[:id])
    @structure_type = StructureType.find(@structure.structure_type_id)
    @structure_classification = StructureClassification.find(@structure.structure_classification_id)
  end

  def new
  end

  def create
    if params[:active] == "true"
      params[:active] = true
    else
      params[:active] = false
    end
    @structure = Structure.create(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes], public: params[:public], active: params[:active])
    if params[:association_details] == "1"
      AssociationDetail.create(structure_id: @structure.id, supporters_amount: params[:number_supporters].to_i, object: params[:object])
    end
    redirect_to admin_structure_path(@structure.id)
  end

  def edit
    @structure = Structure.find(params[:id])
    @selected_structure_type = [StructureType.find(@structure.structure_type_id).name, @structure.structure_type_id]
    @selected_structure_classification = [StructureClassification.find(@structure.structure_classification_id).name, @structure.structure_classification_id]
  end

  def update
    if params[:active] == "true"
      params[:active] = true
    else
      params[:active] = false
    end
    @structure = Structure.find(params[:id])
    if params[:status] == "3" && params[:active] == "3" && params[:public] == "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], notes: params[:notes])
    elsif params[:status] == "3" && params[:active] == "3" && params[:public] != "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], notes: params[:notes], public: params[:public])
    elsif params[:status] == "3" && params[:active] != "3" && params[:public] != "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], notes: params[:notes], public: params[:public], active: params[:active])
    elsif params[:status] == "3" && params[:active] != "3" && params[:public] == "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], notes: params[:notes], active: params[:active])
    elsif params[:status] != "3" && params[:active] != "3" && params[:public] == "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes], active: params[:active])
    elsif params[:status] != "3" && params[:active] == "3" && params[:public] == "3"
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes])

    else
      @structure.update(structure_type_id: params[:structure_type_id], structure_classification_id: params[:structure_classification_id], name: params[:name], description: params[:description], address: params[:address], zip_code: params[:zip_code], city: params[:city], country: params[:country], telephone: params[:telephone], email: params[:email], website: "http://" + params[:website], facebook: "http://" + params[:facebook], twitter: "http://" + params[:twitter], instagram: "http://" + params[:instagram], creation: params[:creation], staff_number: params[:staff_number], status: params[:status], notes: params[:notes], public: params[:public], active: params[:active])
    end

    if @structure.association_detail
      association_details = AssociationDetail.find(@structure.association_detail.id)
      association_details.update(object: params[:object], supporters_amount: params[:number_supporters].to_i)
    end

    @structure.get_lat_lng
    
    redirect_to admin_structure_path(@structure.id)
  end

  def destroy
    @structure = Structure.find(params[:id])
    @structure.destroy
    redirect_to admin_structures_path
  end

  private

  def set_variables
    @structure_types = []
    StructureType.all.order("name ASC").each do |structure_type|
      @structure_types << [structure_type.name, structure_type.id]
    end

    @structure_classifications = []
    StructureClassification.all.order("name ASC").each do |structure_classification|
      @structure_classifications << [structure_classification.name, structure_classification.id]
    end
  end
end
