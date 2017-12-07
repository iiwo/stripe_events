# StripeManager
Simple, quick Stripe event wrapper rails application for stripe_manager engine (bundled for convenience)
Enables simple importing Stripe events to a Postgres database for querying and processing

## Installation
Create `.env` file with values:
```
DATABASE_URL=postgresql://user:password@host:port/database_name
STRIPE_API_KEY=your_api_key
```

## Usage:
```
# import latest events
StripeManager::Importer.new(on_existing_item: :break).call

# import all stripe events
StripeManager::Importer.new(on_existing_item: :ignore).call

# import latest card update events
StripeManager::Importer.new(on_existing_item: :break, filter: { type: 'customer.card.updated' }).call

# import all card update events
StripeManager::Importer.new(on_existing_item: :ignore, filter: { type: 'customer.card.updated' }).call

# import all card update events, starting from specific
StripeManager::Importer.new(on_existing_item: :ignore, filter: { starting_after: 'evt_ID'}).call
```

see Stripe docs for filter options: https://stripe.com/docs/api/ruby#events

rake tasks:
```
rake stripe_manager:import_latest_events
rake stripe_manager:import_all_events
rake stripe_manager:import_latest_card_events
rake stripe_manager:import_all_card_events
```


## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
