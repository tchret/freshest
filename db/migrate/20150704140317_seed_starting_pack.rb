class SeedStartingPack < ActiveRecord::Migration
  def change

    sources = ["latest_is",
    "newsycombinator",
    "WIRED",
    "TheNextWeb",
    "Entrepreneur",
    "designernewsbot",
    "TechCrunch",
    "Recode",
    "Medium",
    "Adweek",
    "Techinasia",
    "businessinsider",
    "ProductHunt",
    "FastCompany",
    "verge"]

    pack = Pack.create(name: 'start')
    sources.each do |source|
      puts source
      s = Source.find_by(twitter_id: source)
      s.packs << pack
    end
  end
end
