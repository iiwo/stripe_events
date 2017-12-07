namespace :stripe_manager do
  desc 'import latest stripe events'
  task :import_latest_events => :environment do
    StripeManager::Importer.new(on_existing_item: :break).call
  end

  desc 'import all stripe events'
  task :import_all_events => :environment do
    StripeManager::Importer.new(on_existing_item: :ignore).call
  end

  desc 'import latest card events'
  task :import_latest_card_events => :environment do
    StripeManager::Importer.new(on_existing_item: :break, filter: { type: 'customer.card.updated' }).call
  end

  desc 'import all card.update events'
  task :import_all_card_events => :environment do
    StripeManager::Importer.new(on_existing_item: :ignore, filter: { type: 'customer.card.updated' }).call
  end
end
