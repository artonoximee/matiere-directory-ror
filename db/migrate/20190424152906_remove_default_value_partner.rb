class RemoveDefaultValuePartner < ActiveRecord::Migration[5.2]
  def change
  	remove_column :partners, :website
  	add_column :partners, :website, :string
  end
end
