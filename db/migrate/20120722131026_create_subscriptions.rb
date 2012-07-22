class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :member_type
      t.integer :amount
      t.string :strip_customer_token

      t.timestamps
    end
  end
end
