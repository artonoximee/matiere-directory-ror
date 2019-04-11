class CreateStructureClassifications < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_classifications do |t|
    	t.string :class
      t.timestamps
    end
  end
end
