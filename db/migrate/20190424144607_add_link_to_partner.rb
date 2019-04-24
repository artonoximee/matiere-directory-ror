class AddLinkToPartner < ActiveRecord::Migration[5.2]
  def change
  	add_column :partners, :website, :string, default: "#"
  end
end
