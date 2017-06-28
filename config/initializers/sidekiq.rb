sidekiq_namespace = "#{ENV['SIDEKIQ_REDIS_NAMESPACE']}_#{Rails.env}"
Sidekiq.configure_server do |config|
  config.redis = {
    namespace: sidekiq_namespace,
    url:       ENV["REDIS_URL"]
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    namespace: sidekiq_namespace,
    url:       ENV["REDIS_URL"]
  }
end
