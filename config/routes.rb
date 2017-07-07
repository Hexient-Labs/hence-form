require "sidekiq/web"

Rails.application.routes.draw do
  root to: redirect("https://hexientlabs.com/henceform")

  scope "app" do
    # Required for devise to know how send customers
    devise_for :users,
               controllers: {
                 confirmations: "users/confirmations"
               },
               only: [:confirmations]
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
  match "/:hence_form_email", to: "submissions#create", via: :all, constraints: { hence_form_email: /.+@.+\..*/ }
end
