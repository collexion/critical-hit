class ChangeStripToStripInSubscriptions < ActiveRecord::Migration
  def up
    rename_column :subscriptions, :strip_customer_token, :stripe_customer_token
  end

  def down
    rename_column :subscriptions, :stripe_customer_token, :strip_customer_token
  end
end
