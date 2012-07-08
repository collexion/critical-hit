class AddMaintainedByToItems < ActiveRecord::Migration
  def change
    add_column :items, :maintained_by, :string
  end
end
