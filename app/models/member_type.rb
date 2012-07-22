class MemberType < ActiveRecord::Base
  has_many :subscriptions
end
