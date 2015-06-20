if @influencers
  # json.picture @user.picture
  json.user do
    json.picture @user.picture
  end
  json.posts do
    json.array!(@influencers) do |influencer|
      json.name influencer.name
      json.avatar_url influencer.avatar_url
      json.title influencer.title
      json.url influencer.article_url
      json.description influencer.description
    end
  end
else
  json.error "user not found"
end