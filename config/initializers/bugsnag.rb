Bugsnag.configure do |config|
  config.api_key = ENV["BUGSNAG_API_KEY"]
  config.auto_notify = Rails.env.production?
end
