class Item < ActiveRecord::Base
  attr_accessible :time_checked_in, :time_checked_out, :checked_out_by,
                  :date_collected, :name, :tag_number, :type, :desc,
                  :checkedin, :checkedout

  before_create :assign_tag_number

  # TODO(chase): should set some defaults before create.
  #             time_checked_out should default to nil on create not Time.now

  def assign_tag_number
    if self.tag_number.nil? || self.tag_number.empty?
      self.tag_number = create_random_tag
    else
      return
    end
  end

  def create_random_tag
    # => "57kie8g"
    ("%d%d" % [rand(100), Time.now.to_i]).to_i.to_s(36)
  end

  def lookup_by_tagnumber(tag)
    where(tag_number: tag).first
  end

end
