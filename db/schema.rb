# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171206201312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stripe_manager_events", force: :cascade do |t|
    t.string "identifier"
    t.string "object"
    t.string "api_version"
    t.datetime "created"
    t.jsonb "data"
    t.boolean "livemode"
    t.integer "pending_webhooks", limit: 2
    t.string "request"
    t.string "type"
    t.string "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data"], name: "index_stripe_manager_events_on_data", using: :gin
    t.index ["identifier"], name: "index_stripe_manager_events_on_identifier"
    t.index ["object_id"], name: "index_stripe_manager_events_on_object_id"
  end

end
