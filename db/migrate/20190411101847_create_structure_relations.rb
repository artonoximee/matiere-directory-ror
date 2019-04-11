class CreateStructureRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_relations do |t|
    	t.belongs_to :supported, index: true
    	t.belongs_to :supporting, index: true
      t.timestamps
    end
  end
end
