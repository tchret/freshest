class AddUrlToSource < ActiveRecord::Migration
  def change
    add_column :sources, :url, :string
    s = Source.find(1)
    s.url = "http://techcrunch.com/"
    s.save

    s = Source.find(2)
    s.url = "http://mashable.com/category/tech/"
    s.save

    s = Source.find(3)
    s.url = "http://www.wired.com/"
    s.save

    s = Source.find(4)
    s.url = "http://www.fastcompany.com/"
    s.save

    s = Source.find(5)
    s.url = "http://www.entrepreneur.com/"
    s.save

    s = Source.find(6)
    s.url = "http://businessinsider.com"
    s.save

    s = Source.find(7)
    s.url = "http://kottke.org/"
    s.save

    s = Source.find(8)
    s.url = "https://medium.com/"
    s.save

    s = Source.find(9)
    s.url = "http://www.producthunt.com/"
    s.save

    s = Source.find(10)
    s.url = "http://thenextweb.com/"
    s.save

    s = Source.find(11)
    s.url = "https://news.ycombinator.com/"
    s.save

    s = Source.find(12)
    s.url = "http://www.theverge.com/"
    s.save

    s = Source.find(13)
    s.url = "http://latest.is/"
    s.save

    s = Source.find(14)
    s.url = "http://alistapart.com/"
    s.save

    s = Source.find(15)
    s.url = "http://recode.net/"
    s.save

    s = Source.find(16)
    s.url = "http://venturebeat.com/"
    s.save

    s = Source.find(17)
    s.url = "https://www.quora.com/"
    s.save

    s = Source.find(18)
    s.url = "https://dribbble.com/"
    s.save

    s = Source.find(19)
    s.url = "http://www.ted.com/"
    s.save

  end
end
