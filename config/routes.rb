require "sidekiq/web"

Rails.application.routes.draw do
  scope "app" do
    devise_for :users, only: [:confirmations] # Required for devise to know how send customers
  end

  # Sidekiq Related
  if Rails.env.production?
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      # Protect against timing attacks:
      # - See https://codahale.com/a-lesson-in-timing-attacks/
      # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
      # - Use & (do not use &&) so that it doesn't short circuit.
      # - Use digests to stop length information leaking
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(username),
        ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])
      ) &
        ActiveSupport::SecurityUtils.secure_compare(
          ::Digest::SHA256.hexdigest(password),
          ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"])
        )
    end
  end
  mount Sidekiq::Web => "/app/sidekiq"

  # New Submission. This is last thing because we don't want it to interfere elsewhere
  post "/:hence_form_email", to: "submissions#create"
end
