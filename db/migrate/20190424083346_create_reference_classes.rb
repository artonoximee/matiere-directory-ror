class CreateReferenceClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_classes do |t|
    	t.string :name
      t.timestamps
    end
    add_reference :references, :reference_class, index: true
  end
end
