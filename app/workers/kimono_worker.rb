class KimonoWorker
  include Sidekiq::Worker

  def perform
    logger.info "*" * 20
    logger.info "STARTING TASK"
    logger.info "*" * 20
    last_posts = IndexData.new.generate
    logger.info "LAST POSTS ARRAY GENERATED"
    last_posts.each do |post|
      influencer = Influencer.find_by(twitter_id: post[:user_id])
      logger.info "BEGINNING UPDATE ON #{influencer.name.upcase}"
      influencer.article_url = post[:href]
      page = MetaInspector.new(post[:href], allow_redirections: false)
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