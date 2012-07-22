class AddLostToItem < ActiveRecord::Migration
  def change
    add_column :items, :lost_item, :boolean, default: false
  end
end
