# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Influencer.create(name: "ProductHunt", twitter_id: "ProductHunt")
Influencer.create(name: "Medium", twitter_id: "Medium")
Influencer.create(name: "Thomas Chrétien", twitter_id: "tchret")
Influencer.create(name: "Paul Graham", twitter_id: "paulg")
Influencer.create(name: "Sébastien Saunier", twitter_id: "ssaunier")
Influencer.create(name: "Mashable Tech", twitter_id: "mashabletech")
Influencer.create(name: "Ryan Hoover", twitter_id: "rrhoover")
Influencer.create(name: "Per Stenius", twitter_id: "Fimpen")
Influencer.create(name: "Richard Branson", twitter_id: "richardbranson")
Influencer.create(name: "Marc Andreessen", twitter_id: "pmarca")
Influencer.create(name: "WIRED", twitter_id: "WIRED")
Influencer.create(name: "TechCrunch", twitter_id: "TechCrunch")
Influencer.create(name: "Aral Balkan", twitter_id: "aral")
Influencer.create(name: "Sam Altman", twitter_id: "sama")
Influencer.create(name: "A List Apart", twitter_id: "alistapart")
Influencer.create(name: "Kottke", twitter_id: "kottke")
Influencer.create(name: "The Latest", twitter_id: "latest_is")
Influencer.create(name: "Business Insider", twitter_id: "businessinsider")
Influencer.create(name: "Harvard Biz Review", twitter_id: "HarvardBiz")
Influencer.create(name: "Fast Company", twitter_id: "FastCompany")
Influencer.create(name: "Entrepreneur", twitter_id: "Entrepreneur")
Influencer.create(name: "Edward Schults", twitter_id: "EdwardSchults")

FreshestWorker.perform_async