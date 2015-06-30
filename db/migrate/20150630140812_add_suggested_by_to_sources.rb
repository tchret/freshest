class AddSuggestedByToSources < ActiveRecord::Migration
  def change
    add_column :sources, :suggested_by, :string
    Source.create(name: "Designer News", twitter_id: "designernewsbot", url: "https://www.designernews.co/")
    Source.create(name: "Medium", twitter_id: "Medium", url: "https://medium.com/")
    Source.create(name: "Adweek", twitter_id: "Adweek", url: "http://www.adweek.com/")
    Source.create(name: "Quibb", twitter_id: "Quibb", url: "http://quibb.com/")
    Source.create(name: "Tech in Asia", twitter_id: "Techinasia", url: "https://www.techinasia.com/")
  end
end
