class Project < ApplicationRecord
	
	include Geokit::Geocoders

	after_create :get_lat_lng

	has_many :project_project_classes
	has_many :project_classes, through: :project_project_classes

	has_many :partner_projects
	has_many :partners, through: :partner_projects

	has_many :structure_projects
	has_many :structures, through: :structure_projects

	enum status: {executed: "0", ongoing: "1", upcoming: "2"}

	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

  def status_fr
		if self.status == "executed"
			return "Réalisé"
		elsif self.status == "ongoing"
			return "En cours"
		else
			return "À venir"
		end
	end

	def structures_array
		structures = []
		self.structures.each do |structure|
			structures << structure.name
		end
		return structures
	end

  def get_lat_lng
		full_address = self.address + ", " + self.zip_code + ", " +  self.city + ", " + self.country
		loc = Geokit::Geocoders::GoogleGeocoder.geocode(full_address)
		if loc.success
			self.update(lat: loc.lat, lng: loc.lng)
		end
	end

	def full_address
		if self.address != "" && self.zip_code != "" && self.city != "" && self.country != ""
			return self.address + ", " + self.zip_code + ", " +  self.city + ", " + self.country
		elsif self.address == "" && self.zip_code != "" && self.city != "" && self.country != ""
			return self.zip_code + ", " +  self.city + ", " + self.country
		elsif self.address == "" && self.zip_code == "" && self.city != "" && self.country != ""
			return self.city + ", " + self.country
		elsif self.address == "" && self.zip_code == "" && self.city == "" && self.country != ""
			return self.country
		end
	end

end
