if @sources
  # json.picture @user.picture
  json.user do
    json.picture @user.picture
  end
  json.posts do
    json.array!(@sources) do |source|
      json.name source.name
      json.avatar_url source.avatar_url
      json.title source.title
      json.url source.article_url
      json.description source.description
    end
  end
else
  json.error "user not found"
end
