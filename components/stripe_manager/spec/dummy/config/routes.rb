Rails.application.routes.draw do
  mount StripeManager::Engine => "/stripe_manager"
end
