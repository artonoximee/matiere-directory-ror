class CreateReferences < ActiveRecord::Migration[5.2]
  def change
    create_table :references do |t|
    	t.string :title
    	t.string :first_name
    	t.string :last_name
    	t.integer :year
    	t.string :editor
    	t.string :city
    	t.string :country
    	t.string :link
    	t.text :notes
      t.timestamps
    end
  end
end
