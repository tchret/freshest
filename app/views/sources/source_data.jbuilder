json.name @source.name
json.avatar @source.avatar_url
json.twitter_id @source.twitter_id
json.suggested? @source.user != nil
json.suggester @source.user
json.url @source.url