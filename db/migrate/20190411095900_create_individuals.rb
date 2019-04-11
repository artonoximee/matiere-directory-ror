class CreateIndividuals < ActiveRecord::Migration[5.2]
  def change
    create_table :individuals do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :telephone
    	t.string :linkedin
      t.timestamps
    end
  end
end
