class CreateStructureIndividuals < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_individuals do |t|
    	t.belongs_to :structure, index: true
    	t.belongs_to :individual, index: true
      t.timestamps
    end
  end
end
