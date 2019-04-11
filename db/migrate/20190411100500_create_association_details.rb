class CreateAssociationDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :association_details do |t|
    	t.belongs_to :structure, index: true
    	t.integer :supporters_amount
      t.timestamps
    end
  end
end
