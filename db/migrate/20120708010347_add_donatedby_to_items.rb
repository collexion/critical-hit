class AddDonatedbyToItems < ActiveRecord::Migration
  def change
    add_column :items, :donated_by, :string
  end
end
