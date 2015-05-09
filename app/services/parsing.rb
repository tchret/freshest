class Parsing
  def initialize(user)
    @user = user
  end

  def freshest_post
    get_freshest_post(html_doc)
  end

  def get_twitter_image
    image_url = html_doc.search('.ProfileAvatar-image').attr('src')
  end

  private

  def get_twitter_profile
    twitter_path = @user.twitter_id[1..-1]
    open("https://twitter.com/#{twitter_path}")
  end

  def html_doc
    Nokogiri::HTML(get_twitter_profile)
  end

  def get_freshest_post(html_doc)
    freshest_post = html_doc.search('.ProfileTweet-text').first
    freshest_post.css('span.invisible').remove
    freshest_post
  end
end