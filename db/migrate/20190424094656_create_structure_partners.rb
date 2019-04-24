class CreateStructurePartners < ActiveRecord::Migration[5.2]
  def change
    create_table :structure_partners do |t|
      t.belongs_to :structure, index: true
      t.belongs_to :partner, index: true
      t.timestamps
    end
  end
end
