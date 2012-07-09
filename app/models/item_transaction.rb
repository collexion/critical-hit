class ItemTransaction < ActiveRecord::Base
  attr_accessible :item_checkin_time, :item_checkout_time, :item_creation_time, :item_deletion_time, :item_id, :user_id
end
