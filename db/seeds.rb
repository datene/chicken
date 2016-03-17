# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Challenge.destroy_all

Challenge.create!(name: 'Reading Challenge', activity: 'reading', wager_amount: 50, wager_description: 'most awesome challenge ever known', wager_name: 'ReadingBookClub', allotment: 3, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )
Challenge.create!(name: 'Biking Challenge', activity: 'biking', wager_amount: 20, wager_description: 'most awesome challenge ever known', wager_name: 'dinner', allotment: 5, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )
Challenge.create!(name: 'Running Challenge', activity: 'running', wager_amount: 30, wager_description: 'most awesome challenge ever known', wager_name: 'lunchgoal', allotment: 4, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )
Challenge.create!(name: 'Painting Challenge', activity: 'painting', wager_amount: 60, wager_description: 'most awesome challenge ever known', wager_name: 'too much money wager', allotment: 2, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )
Challenge.create!(name: 'Meditating Challenge', activity: 'meditate', wager_amount: 20, wager_description: 'most awesome challenge ever known', wager_name: 'goalClub', allotment: 3, status: 'accepted', deadline: Date.today + 4.weeks, start_date: Date.today )

User.create!(first_name: "Lars", last_name: "Bohm", photo_url: "", email: "lars@lars.nl", password: "whatever")
User.create!(first_name: "Lena", last_name: "Hartog", photo_url: "", email: "lena@lena.nl", password: "whatever")
User.create!(first_name: "Michele", last_name: "de Bruyn", photo_url: "", email: "michele@michele.nl", password: "whatever")
