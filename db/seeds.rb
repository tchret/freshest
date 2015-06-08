# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Influencer.create(name: "TechCrunch", twitter_id: "TechCrunch", content: "article-entry text")
Influencer.create(name: "Mashable Tech", twitter_id: "mashabletech", content_class: "article-content")
Influencer.create(name: "WIRED", twitter_id: "WIRED", content_class: "content")
Influencer.create(name: "Fast Company", twitter_id: "FastCompany", content_class: "article-prose")
Influencer.create(name: "Entrepreneur", twitter_id: "Entrepreneur", content_class: "bodycopy")
Influencer.create(name: "Business Insider", twitter_id: "businessinsider", content_class: "post-content")
Influencer.create(name: "Harvard Biz Review", twitter_id: "HarvardBiz", content_class: "article-first-row")
Influencer.create(name: "Kottke", twitter_id: "kottke", content_class: "post")
Influencer.create(name: "Medium", twitter_id: "Medium", content_class: "section-content")
Influencer.create(name: "ProductHunt", twitter_id: "ProductHunt", content_class: "modal-post")

Influencer.create(name: "The Next Web", twitter_id: "TheNextWeb", content_class: "postContent")
Influencer.create(name: "Hacker News", twitter_id: "newsycombinator")
Influencer.create(name: "The Verge", twitter_id: "verge", content_class: "m-article__entry")


# Influencer.create(name: "The Latest", twitter_id: "latest_is")
# Influencer.create(name: "Thomas Chrétien", twitter_id: "tchret")
# Influencer.create(name: "Paul Graham", twitter_id: "paulg")
# Influencer.create(name: "Sébastien Saunier", twitter_id: "ssaunier")
# Influencer.create(name: "Edward Schults", twitter_id: "EdwardSchults")
# Influencer.create(name: "Ryan Hoover", twitter_id: "rrhoover")
# Influencer.create(name: "Per Stenius", twitter_id: "Fimpen")
# Influencer.create(name: "Richard Branson", twitter_id: "richardbranson")
# Influencer.create(name: "Marc Andreessen", twitter_id: "pmarca")
# Influencer.create(name: "Aral Balkan", twitter_id: "aral")
# Influencer.create(name: "Sam Altman", twitter_id: "sama")
# Influencer.create(name: "A List Apart", twitter_id: "alistapart")

FreshestWorker.perform_async