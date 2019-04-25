class CreateProjectProjectClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :project_project_classes do |t|
    	t.belongs_to :project
    	t.belongs_to :project_class
      t.timestamps
    end
  end
end
