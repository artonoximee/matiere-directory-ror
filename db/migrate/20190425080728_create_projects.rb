class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
    	t.string :title
    	t.text :description
    	t.string :website
    	t.string :status
    	t.integer :year
    	t.string :address
    	t.string :zip_code
    	t.string :city
    	t.string :country
    	t.decimal :lat, {:precision => 10, :scale => 6}
    	t.decimal :lng, {:precision => 10, :scale => 6}
    	t.text :notes
      t.timestamps
    end
  end
end
