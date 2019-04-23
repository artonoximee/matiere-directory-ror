class AddTwoColumnsToStructure < ActiveRecord::Migration[5.2]
  def change
  	add_column :structures, :active, :boolean, default: true
  	add_column :structures, :public, :string, default: "0"
  end
end
