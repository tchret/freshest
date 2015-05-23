class FreshestWorker
  include Sidekiq::Worker

  def perform
    logger.info "*" * 20
    logger.info "STARTING TASK"
    logger.info "*" * 20
    last_posts = TwitterService.new.client.list_timeline('freshst-dev')
    logger.info "LAST POSTS ARRAY GENERATED"
    last_posts.each do |tweet|
      influencer = Influencer.find_by(twitter_id: tweet.user.screen_name)
      logger.info "BEGINNING UPDATE ON #{influencer.name.upcase}"
      if tweet.urls.first
        influencer.article_url = tweet.urls.first.url.to_s
        influencer.avatar_url = tweet.user.profile_image_url_https.to_s
        logger.info "--------------------- 1 ------------------------"
        influencer.last_post_at = tweet.created_at
        logger.info "--------------------- 2 ------------------------"
        page = MetaInspector.new(influencer.article_url, allow_redirections: false)
        influencer.title = page.title.split(" | ").first
        influencer.description = page.description
        influencer.article_picture = page.meta_tags["name"]["twitter:image:src"] ? page.meta_tags["name"]["twitter:image:src"].first : page.images.best
        influencer.content = page.meta_tags["name"]["content"] ? page.meta_tags["name"]["content"].first : page.description
        if influencer.save
          logger.info "#{influencer.name} was updated"
        else
          logger.info "#{influencer.name} was NOT updated"
        end
      end
    end
  end
end