class CreateItemTransactions < ActiveRecord::Migration
  def change
    create_table :item_transactions do |t|
      t.integer :item_id
      t.datetime :item_creation_time
      t.datetime :item_checkin_time
      t.datetime :item_checkout_time
      t.datetime :item_deletion_time
      t.integer :user_id

      t.timestamps
    end
  end
end
