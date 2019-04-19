class CreateReferenceAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :reference_authors do |t|
      t.belongs_to :reference, index: true
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
