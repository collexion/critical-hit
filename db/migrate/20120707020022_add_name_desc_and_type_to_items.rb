class AddNameDescAndTypeToItems < ActiveRecord::Migration
  def change
    add_column :items, :type, :string
    add_column :items, :desc, :text
  end
end
