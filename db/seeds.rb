# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Source.create(name: "TechCrunch", twitter_id: "TechCrunch")
Source.create(name: "Mashable Tech", twitter_id: "mashabletech")
Source.create(name: "WIRED", twitter_id: "WIRED")
Source.create(name: "Fast Company", twitter_id: "FastCompany")
Source.create(name: "Entrepreneur", twitter_id: "Entrepreneur")
Source.create(name: "Business Insider", twitter_id: "businessinsider")
Source.create(name: "Kottke", twitter_id: "kottke")
Source.create(name: "Medium", twitter_id: "Medium")
Source.create(name: "ProductHunt", twitter_id: "ProductHunt")
Source.create(name: "The Next Web", twitter_id: "TheNextWeb")
Source.create(name: "Hacker News", twitter_id: "newsycombinator")
Source.create(name: "The Verge", twitter_id: "verge")
Source.create(name: "The Latest", twitter_id: "latest_is")
Source.create(name: "A List Apart", twitter_id: "alistapart")
Source.create(name: "Re/code", twitter_id: "Recode")
Source.create(name: "VentureBeat", twitter_id: "VentureBeat")
Source.create(name: "Quora", twitter_id: "Quora")



# Source.create(name: "Thomas Chrétien", twitter_id: "tchret")
# Source.create(name: "Paul Graham", twitter_id: "paulg")
# Source.create(name: "Sébastien Saunier", twitter_id: "ssaunier")
# Source.create(name: "Edward Schults", twitter_id: "EdwardSchults")
# Source.create(name: "Ryan Hoover", twitter_id: "rrhoover")
# Source.create(name: "Per Stenius", twitter_id: "Fimpen")
# Source.create(name: "Richard Branson", twitter_id: "richardbranson")
# Source.create(name: "Marc Andreessen", twitter_id: "pmarca")
# Source.create(name: "Aral Balkan", twitter_id: "aral")
# Source.create(name: "Sam Altman", twitter_id: "sama")

FreshestWorker.perform_async