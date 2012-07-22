# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Item.create!(
  {
    name: "Hammer",
    date_collected: Time.now,
    time_checked_in: Time.now,
    item_type: "Tool",
    desc: "16 oz, Oak handle",
    donated_by: "Chase Southard",
    maintained_by: ""
  }
) then puts "Created some items." end