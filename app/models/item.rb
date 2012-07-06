class Item < ActiveRecord::Base
  attr_accessible :checked_in, :checked_out, :checked_out_by, :date_collected, :name, :tag_number
end
