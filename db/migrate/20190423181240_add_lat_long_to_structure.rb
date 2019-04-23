class AddLatLongToStructure < ActiveRecord::Migration[5.2]
  def change
  	add_column :structures, :lat, :decimal, {:precision => 10, :scale => 6}
  	add_column :structures, :lng, :decimal, {:precision => 10, :scale => 6}
  end
end
