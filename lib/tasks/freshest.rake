namespace :freshest do
  desc "TODO"
  task refresh: :environment do
    FreshestWorker.perform_async
  end

  desc "Clear expired sessions"
  task clear_expired_sessions: :environment do
      sql = "DELETE FROM sessions WHERE updated_at < (CURRENT_TIMESTAMP - INTERVAL '3 days');"
      ActiveRecord::Base.connection.execute(sql)
  end
end
