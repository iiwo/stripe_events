module StripeManager
  class Page
    attr_accessor :response

    def initialize(client: Stripe::Event, filter: {}, params: {})
      self.client = client
      self.filter = { limit: 100 }.merge(filter)
      self.params = { api_key: StripeManager.api_key }.merge(params)
    end

    def call
      self.response = client.list(filter, params)
    end

    def next_page
      next_page_object if next?
    end

    private

    attr_accessor :client, :filter, :params

    def next_page_object
      StripeManager::Page.new(
        client: client,
        params: params,
        filter: filter.merge(starting_after: response.data.last.id)
      )
    end

    def next?
      response.has_more?
    end
  end
end