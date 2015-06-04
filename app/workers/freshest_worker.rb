class FreshestWorker
  include Sidekiq::Worker

  def perform
    logger.info "*" * 40
    logger.info "STARTING TASK"
    logger.info "*" * 40
    last_posts = TwitterService.new.client.list_timeline('freshst-dev', {include_rts: false})
    logger.info "LAST POSTS ARRAY GENERATED"
    last_posts.uniq(&:user).each do |tweet|
      influencer = Influencer.find_by(twitter_id: tweet.user.screen_name)
      if tweet.urls.first
        logger.info "BEGINNING UPDATE ON #{influencer.name.upcase}"
        influencer.article_url = tweet.urls.first.url.to_s
        influencer.avatar_url = tweet.user.profile_image_url_https.to_s
        logger.info "--------------------- 1 ------------------------"
        influencer.last_post_at = tweet.created_at
        logger.info "--------------------- 2 ------------------------"
        page = MetaInspector.new(influencer.article_url)
        influencer.title = page.title.split(" | ").first
        influencer.description = page.description
        influencer.article_picture = page.meta_tags["name"]["twitter:image:src"] ? page.meta_tags["name"]["twitter:image:src"].first : page.images.best
        if influencer.content_class.nil?
          influencer.content = page.meta_tags["name"]["content"] ? page.meta_tags["name"]["content"].first : influencer.description
        else
          influencer.content = page.meta_tags["name"]["content"] ? page.meta_tags["name"]["content"].first : (page.parsed.search(".#{influencer.content_class}").first.nil? ? page.description : page.parsed.search(".#{influencer.content_class}").to_s)
        end
        if influencer.save
          logger.info "#{influencer.name.upcase} WAS UPDATED"
        else
          logger.info "#{influencer.name} was NOT updated"
        end
      else
        logger.info "SKIPPING UPDATE ON #{influencer.name.upcase} >> NO HREF"
      end
    end
  end
end