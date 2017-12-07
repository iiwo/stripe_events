class CreateStripeManagerEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :stripe_manager_events do |t|
      t.string :identifier, index: true # evt_XXXX
      t.string :object # event
      t.string :api_version # 2014-01-31
      t.timestamp :created # 1502689202
      t.jsonb :data # {}
      t.boolean :livemode # true
      t.integer :pending_webhooks, limit: 2  # 0
      t.string :request # req_XXXX
      t.string :type, index: true # customer.created
      t.string :object_id, index: true # cst_XXXX
      
      t.timestamps
    end

    add_index :stripe_manager_events, :data, using: :gin
  end
end
