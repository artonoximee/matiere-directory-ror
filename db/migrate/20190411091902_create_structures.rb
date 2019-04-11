class CreateStructures < ActiveRecord::Migration[5.2]
  def change
    create_table :structures do |t|
    	t.string :name
    	t.text :description
    	t.string :address
    	t.string :zip_code
    	t.string :city
    	t.string :telephone
    	t.string :email
    	t.string :website
    	t.string :facebook
    	t.string :twitter
    	t.string :instagram
    	t.integer :creation
    	t.integer :staff_number
    	t.text :notes
    	t.string :status, default: "0"
    	t.belongs_to :structure_type, index: true
    	t.belongs_to :structure_classification, index: true
      t.timestamps
    end
  end
end
