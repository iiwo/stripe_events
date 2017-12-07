require 'stripe'
require 'stripe_manager/page'
require 'stripe_manager/importer'
require 'stripe_manager/engine'

module StripeManager
  mattr_accessor :api_key

  def self.setup
    yield self
  end
end
