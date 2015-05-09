class Parsing
  def initialize(user)
    @user = user
  end

  def freshest_post
    html_doc = Nokogiri::HTML(get_twitter_profile)
    get_freshest_post(html_doc)
  end

  private

  def is_pinned?(post)

  end

  def get_twitter_profile
    twitter_path = @user.twitter_id[1..-1]
    open("https://twitter.com/#{twitter_path}")
  end

  def get_freshest_post(html_doc)
    freshest_post = html_doc.search('.ProfileTweet-text').first
    freshest_post.css('span.invisible').remove
    freshest_post
  end
end