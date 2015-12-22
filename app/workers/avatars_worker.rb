class AvatarsWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable
  sidekiq_options :retry => false

  recurrence { daily }

  def perform
    logger.info "*" * 40
    logger.info "STARTING AVATARS UPDATE"
    logger.info "*" * 40
    ts = TwitterService.new.client
    users = User.all
    i = 0
    users.each do |user|
      if i % 15 == 0
        sleep(900)
      else
        unless user.id == 169
          begin
            unless user.picture == ts.user(user.twitter_id).profile_image_url.to_s
            logger.info "updating avatar for #{user.twitter_id.upcase}...."
              user.picture = ts.user(user.twitter_id).profile_image_url.to_s
              if user.save
                logger.info "#{user.twitter_id.upcase}'s avatar updated!"
              else
                logger.info "#{user.twitter_id.upcase}'s avatar NOT updated :("
              end
            end
          rescue Twitter::Error::NotFound => error
            logger.info error
          end
          i += 1
        end
      end
    end
  end
end