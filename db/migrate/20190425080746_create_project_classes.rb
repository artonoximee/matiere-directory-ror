class CreateProjectClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :project_classes do |t|
    	t.string :name
      t.timestamps
    end
  end
end
