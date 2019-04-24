class Admin::StructurePartnersController < ApplicationController
	def new
		@structure_partners = StructurePartner.all

		@structures = []
    Structure.all.each do |structure|
      @structures << [structure.name, structure.id]
    end

    @partners = []
    Partner.all.each do |partner|
    	@partners << [partner.name, partner.id]
    end
	end

	def create
		structure_partner = StructurePartner.create(structure_id: params[:structure_id], partner_id: params[:partner_id])
		redirect_to new_admin_structure_partner_path
	end

	def destroy
		structure_partner = StructurePartner.find(params[:id])
    structure_partner.destroy
    redirect_to new_admin_structure_partner_path
	end
end
