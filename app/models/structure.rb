class Structure < ApplicationRecord
	include Geokit::Geocoders

	after_create :get_lat_lng

	belongs_to :structure_type
	belongs_to :structure_classification

	has_many :structure_individuals
	has_many :individuals, through: :structure_individuals

	has_many :is_parent, foreign_key: "parent_id", class_name: "ParentChildRelation"
	has_many :is_child, foreign_key: "child_id", class_name: "ParentChildRelation"
	has_many :child_structures, through: :is_parent, source: :child
	has_many :parent_structures, through: :is_child, source: :parent

	has_many :is_supported, foreign_key: "supported_id", class_name: "StructureRelation"
	has_many :is_supported_by, through: :is_supported, source: :supporting
	has_many :supports_structures, foreign_key: "supporting_id", class_name: "StructureRelation"
	has_many :supports, through: :supports_structures, source: :supported

	has_many :structure_partners
	has_many :partners, through: :structure_partners

	has_many :structure_projects
	has_many :projects, through: :structure_projects

	has_one :association_detail

	enum status: {player: "0", partner: "1", both: "2"}

	enum public: {large_public: "0", professional: "1", for_all: "2"}

	acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :lng

	def status_fr
		if self.status == "player"
			return "Acteur"
		elsif self.status == "partner"
			return "Partenaire"
		else
			return "Acteur & Partenaire"
		end
	end

	def public_fr
		if self.public == "large_public"
			return "Grand Public"
		elsif self.public == "professional"
			return "Professionnel"
		else
			return "Grand public & Professionnel"
		end
	end

	def active?
		if self.active == true
			return "Actif"
		else
			return "Non Actif"
		end
	end

	def full_address
		return self.address + ", " + self.zip_code + ", " +  self.city + ", " + self.country
	end

	def get_lat_lng
		full_address = self.address + ", " + self.zip_code + ", " +  self.city + ", " + self.country
		loc = Geokit::Geocoders::GoogleGeocoder.geocode(full_address)
		if loc.success
			self.update(lat: loc.lat, lng: loc.lng)
		end
	end

	def array_partners
		array_partners = []
		self.partners.each do |partner|
			array_partners << partner.name
		end
		return array_partners
	end

end
