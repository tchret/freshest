class FreshestWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :retry => false

  recurrence { minutely }

  ERRORS = [EOFError, ActiveRecord::StatementInvalid, OpenURI::HTTPError, NoMethodError, StandardError]

  def perform
    logger.info "*" * 40
    logger.info "STARTING TASK"
    logger.info "*" * 40
    last_posts = TwitterService.new.client.list_timeline('mlkjhgfdsq', {include_rts: false})
    logger.info "LAST POSTS ARRAY GENERATED"
    last_posts.uniq(&:user).each do |tweet|
      source = Source.find_by(twitter_id: tweet.user.screen_name)
      if source
        if tweet.urls.first
          begin
            logger.info "BEGINNING UPDATE ON #{source.name.upcase}"
            source.article_url = get_original_link(tweet.urls.first.url.to_s)
            source.avatar_url = tweet.user.profile_image_url_https.to_s.gsub('normal', '400x400')
            logger.info "--------------------- 1 ------------------------"
            source.last_post_at = tweet.created_at
            logger.info "--------------------- 2 ------------------------"
            page = MetaInspector.new(source.article_url)
            source.title = page.title.split(" | ").first
            source.description = page.description
            source.iframeable = url_iframeable?(source.article_url)
          rescue *ERRORS => error
            logger.info error
          end
          if source.save
            logger.info "#{source.name.upcase} WAS UPDATED"
          else
            logger.info "#{source.name} was NOT updated"
          end
        else
          logger.info "SKIPPING UPDATE ON #{source.name.upcase} >> NO HREF"
        end
      else
        logger.info "SOURCE MODIFIED ITS TWITTER ID >> INSPECT IN TWITTER LIST"
      end
    end
  end

  def get_original_link(link)
    open(link, allow_redirections: :all) { |resp|  resp.base_uri.to_s }
  end

  def url_iframeable?(url)
    open(url, allow_redirections: :all) {|f| !f.meta.has_key?("x-frame-options") }
  end
end