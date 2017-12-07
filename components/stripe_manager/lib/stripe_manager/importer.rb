module StripeManager
  class Importer
    NoNewItems = Class.new(StandardError)

    def initialize(client: Stripe::Event, model: StripeManager::Event, filter: {}, on_existing_item: :break)
      self.client = client
      self.model = model
      self.filter = filter
      self.on_existing_item = on_existing_item
    end

    def call
      import
    end

    private

    attr_accessor :client, :model, :filter, :on_existing_item

    def import
      page = StripeManager::Page.new(client: client, filter: filter)

      while page
        process_items(items: page.call.data)
        page = page.next_page
        puts '.'
      end
    rescue NoNewItems
      # import complete
    end

    def process_items(items:)
      items.each do |item|
        model_instance = model.find_by(identifier: item.id) || model.new
        case on_existing_item
          when :break
            raise NoNewItems
          when :ignore
            model_instance.initialize_with(hash: item.to_hash).save! unless model_instance.persisted?
          else
            # update
            model_instance.initialize_with(hash: item.to_hash).save!
        end
      end
    end
  end
end
