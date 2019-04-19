class AddColumnsToIndividual < ActiveRecord::Migration[5.2]
  def change
  	add_column :individuals, :notes, :text
  	add_column :individuals, :profession, :string
  end
end
