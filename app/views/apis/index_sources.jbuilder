json.array!(@sources) do |source|
  json.name source.name
  json.avatar_url source.avatar_url
  json.title source.title
  json.url source.article_url
  json.description source.description
end