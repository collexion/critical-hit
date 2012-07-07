class Item < ActiveRecord::Base
  attr_accessible :checked_in, :checked_out, :checked_out_by, :date_collected, :name, :tag_number

  validates :tag_number, uniqueness: true, allow_nil: true

  before_save :assign_tag_number

  def assign_tag_number
    if self.tag_number.nil?
      self.tag_number = create_random_tag
    else
      return
    end
  end

  def create_random_tag
    # => "57kie8g"
    ("%d%d" % [rand(100), Time.now.to_i]).to_i.to_s(36)
  end

end
