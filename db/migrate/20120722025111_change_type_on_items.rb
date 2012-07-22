class ChangeTypeOnItems < ActiveRecord::Migration
  def up
    rename_column :items, :type, :item_type
  end

  def down
    rename_column :items, :item_type, :type
  end
end
