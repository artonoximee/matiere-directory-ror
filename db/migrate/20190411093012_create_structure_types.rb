class CreateStructureTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_types do |t|
    	t.string :name
      t.timestamps
    end
  end
end
