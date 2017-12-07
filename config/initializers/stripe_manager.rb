StripeManager.setup do |config|
  config.api_key = ENV['STRIPE_API_KEY']
end
