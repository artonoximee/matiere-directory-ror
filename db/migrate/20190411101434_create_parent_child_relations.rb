class CreateParentChildRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :parent_child_relations do |t|
    	t.belongs_to :parent, index: true
    	t.belongs_to :child, index: true
      t.timestamps
    end
  end
end
