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


[
  {
    name: 'Student',
    description: 'Schooled',
    donation_rate: 5
  },
  {
    name: 'Hacker',
    description: '1337',
    donation_rate: 25
  },
  {
    name: 'Maker',
    description: 'I love the smell of solder in the morning.',
    donation_rate: 50
  },
  {
    name: 'Crazy-wise',
    description: 'Just look at my beard.',
    donation_rate: 75
  }
].each.with_index(1) do |e,i|
  if MemberType.create!(e, without_protection: true)
    puts "Created Member Type #{i}."
  end
end
