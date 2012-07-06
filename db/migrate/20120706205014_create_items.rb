class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :date_collected
      t.datetime :checked_in
      t.datetime :checked_out
      t.integer :checked_out_by
      t.string :tag_number

      t.timestamps
    end
  end
end
