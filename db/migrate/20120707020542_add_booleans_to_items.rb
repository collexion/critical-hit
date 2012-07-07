class AddBooleansToItems < ActiveRecord::Migration
  def change
    add_column :items, :checkedin, :boolean, default: true
    add_column :items, :checkedout, :boolean, default: false
  end
end
