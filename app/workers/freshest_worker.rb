class FreshestWorker
  include Sidekiq::Worker

  def perform
    logger.info "*" * 20
    logger.info "STARTING TASK"
    logger.info "*" * 20
    last_posts = TwitterService.new.client.list_timeline('freshst-dev')
    logger.info "LAST POSTS ARRAY GENERATED"
    last_posts.each do |tweet|
      logger.info "BEGINNING TREATMENT OF #{tweet}"
      influencer = Influencer.find_by(twitter_id: tweet.user.username)
      logger.info "BEGINNING UPDATE ON #{influencer.name.upcase}"
      influencer.article_url = tweet.urls.first.attrs[:expanded_url]
      influencer.last_post_at = tweet.created_at
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