class Item < ActiveRecord::Base
  has_paper_trail

  # NOTE(chase): I know this is wrong but here for test.
  # TODO(chase): Protect the attributes.
  attr_accessible :time_checked_in, :time_checked_out, :checked_out_by,
                  :date_collected, :name, :tag_number, :item_type, :desc,
                  :checkedin, :checkedout, :donated_by, :maintained_by

  before_create :set_defaults
  before_create :assign_tag_number

  # Validations
  # Should validate that Item can't be checkedin and checkedout simultaneously

  # TODO(chase): should set some defaults before create.
  #             time_checked_out should default to nil on create not Time.now

  def set_defaults
    self.time_checked_out = nil
  end

  def assign_tag_number
    if self.tag_number.nil? || self.tag_number.empty?
      # TODO(chase): should probably test if the tag number previously exists
      self.tag_number = create_random_tag
    else
      return
    end
  end

  def create_random_tag
    # => "57kie8g"
    ("%d%d" % [rand(100), Time.now.to_i]).to_i.to_s(36)
  end

  def lookup_by_tag_number(tag)
    where(tag_number: tag).first
  end

  # Changes the checkedin, checkedout status and timestamp.
  def change_availability(user_id)
    unless self.lost_item?
      if self.checkedin?
        # change to checkedout
        self.update_attributes(checkedout: true, time_checked_in: '',
                                checkedin: false, checked_out_by: user_id,
                                time_checked_out: Time.now)
      elsif self.checkedout?
        # change to checkedin
        self.update_attributes(checkedout: false, time_checked_in: Time.now,
                                checkedin: true, checked_out_by: '',
                                time_checked_out: nil)
      else
        raise 'unable to change availbility'
      end
    end
  end

  def change_existence
    # set lost_item to true or false
    self.update_attributes(lost_item: true)
  end
end
