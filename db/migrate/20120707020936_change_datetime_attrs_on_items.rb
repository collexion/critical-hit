class ChangeDatetimeAttrsOnItems < ActiveRecord::Migration
  def change
    rename_column :items, :checked_in, :time_checked_in
    rename_column :items, :checked_out, :time_checked_out
  end
end
