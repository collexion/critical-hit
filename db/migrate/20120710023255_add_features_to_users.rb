class AddFeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :title, :string
    add_column :users, :bio, :string
    add_column :users, :joined_at, :date
    add_column :users, :renew_membership_at, :date
    add_column :users, :member_type_id, :integer
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :signed_waiver, :boolean
    add_column :users, :has_key, :boolean
    add_column :users, :role, :string
   end
end
