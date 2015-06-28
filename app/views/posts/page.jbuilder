if @sources
  json.posts do
    json.array!(@sources) do |source|
      json.name source.name
      json.avatar_url source.avatar_url
      json.title source.title
      json.article_url source.article_url
      json.description source.description
      json.iframeable source.iframeable
      json.last_post_at source.last_post_at
      json.twitter_id source.twitter_id
    end
  end
else
 json.error "page not found"
end
