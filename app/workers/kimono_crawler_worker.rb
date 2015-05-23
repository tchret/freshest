# class KimonoCrawlerWorker
#   include Sidekiq::Worker

#   def perform
#     logger.info "*" * 40
#     logger.info "STARTING CRAWL"
#     logger.info "*" * 40
#     RestClient.post "https://www.kimonolabs.com/kimonoapis/8b6fnvc4/startcrawl", apikey: "zj0UIbRDN9o2vsuGGQpVztNcFI9Udzch"
#     logger.info "*" * 40
#     logger.info "ENDING CRAWL"
#     logger.info "*" * 40
#   end
# end