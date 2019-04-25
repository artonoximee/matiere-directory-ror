class CreatePartnerProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :partner_projects do |t|
    	t.belongs_to :partner
    	t.belongs_to :project
      t.timestamps
    end
  end
end
