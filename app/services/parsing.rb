class Parsing
  def initialize(user)
    @user = user
  end

  def freshest_post
    get_freshest_post(twitter_profile)
  end

  def get_twitter_image
    image_url = twitter_profile.search('.ProfileAvatar-image').attr('src')
  end

  def get_twitter_profile
    twitter_profile
  end

  private

  def twitter_profile
    twitter_path = @user.twitter_id[1..-1]
    Nokogiri::HTML(open("https://twitter.com/#{twitter_path}"))
  end

  def get_freshest_post(html_doc)
    freshest_post = html_doc.search('.ProfileTweet').first
    freshest_post.css('span.invisible').remove
    skip_service
    freshest_post
  end

  def skip_service
  end


end