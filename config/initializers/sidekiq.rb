Sidekiq.configure_server do |config|
  config.redis = { url: 'http://redis.io:6379/12' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'http://redis.io:6379/12' }
end