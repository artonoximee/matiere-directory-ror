
class MapsController < ApplicationController
	def global
		@structures = Structure.all.order("name ASC")
		@projects = Project.all.order("title ASC")
	end
end
