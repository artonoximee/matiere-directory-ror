class AddObjectToAssociationDetails < ActiveRecord::Migration[5.2]
  def change
  	add_column :association_details, :object, :text
  	add_column :structures, :country, :string
  end
end
