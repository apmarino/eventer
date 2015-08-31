# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Event.delete_all


user1 = User.create({user_name: "apmarino", password_digest: "1234", about_me: "I'm cool", avatar: "lorempixel.com/100/100", twitter: "this"})
event1 = Event.create({artist_name: "Chvrches", artist_image: "https://flavorwire.files.wordpress.com/2014/08/artworks-000058757165-6tnuep-t500x500.jpg", venue_name: "Baby's All Right", location: "146 Broadway, Brooklyn, NY 11211", date: "2015-09-05 [01:00:00]"})
EventsUser.create({event_id: event1.id, user_id: user1.id})