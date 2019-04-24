class Reference < ApplicationRecord
	has_many :reference_authors
	has_many :authors, through: :reference_authors
	
	belongs_to :reference_class

	def authors_array
		authors = []
	  self.authors.each do |author|
      authors << author.first_name.capitalize + " " + author.last_name.upcase
    end
    return authors
	end
end
