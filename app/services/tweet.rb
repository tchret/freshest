class Tweet
  def initialize(tweet_from_kimono)
    @tweet_from_kimono = tweet_from_kimono
  end

  def generate
    t = @tweet_from_kimono
      {
        content: handle_content(t["content"]),
        href: t["link"].class == Array ? t["link"].first["href"] : false,
        user_image: t["avatar"]["src"].gsub('bigger', '400x400'),
        user_id: t["username"]["text"],
        user_name: t["full_name"]["text"],
        created_at: get_date(t["time_ago"]["text"])
      }
  end

  private

  def handle_content(content)
    if content.class == Array
      # TODO : deal with cited tweet
    else
      content = content["text"]
    end

    content
  end

  def get_date(string)
    value = string[/\d+/].to_i
    date_in_seconds = Time.now.to_i
    date = nil
    if string.include? "s" # deal_with_seconds
      date = date_in_seconds - value
      DateTime.strptime(date.to_s,'%s')
    elsif string.include? "m" # deal_with_minutes
      date = date_in_seconds - (value * 60)
      DateTime.strptime(date.to_s,'%s')
    elsif string.include? "h" # deal_with_hours
      date = date_in_seconds - (value * 3600)
      DateTime.strptime(date.to_s,'%s')
    end
  end
end