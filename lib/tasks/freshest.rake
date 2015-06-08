namespace :freshest do
  desc "TODO"
  task refresh: :environment do
    FreshestWorker.perform_async
  end
end
