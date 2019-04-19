class UpdateReferenceModel < ActiveRecord::Migration[5.2]
  def change
  	add_column :references, :summary, :text
  	remove_column :references, :first_name
  	remove_column :references, :last_name
  end
end
