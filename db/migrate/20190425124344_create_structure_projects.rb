class CreateStructureProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_projects do |t|
    	t.belongs_to :structure
    	t.belongs_to :project
      t.timestamps
    end
  end
end
