# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_11_045218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.bigint "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_accounts_on_device_id"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.boolean "eula"
    t.time "start_hour"
    t.time "end_hour"
    t.string "url"
    t.string "code"
    t.string "total_comments"
    t.integer "frequency_to_be_found"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.integer "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_bank_accounts_on_supplier_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.string "title"
    t.bigint "journalist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journalist_id"], name: "index_certificates_on_journalist_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id"
    t.string "status"
    t.string "email"
    t.string "email_confirmation"
    t.integer "body_characters_count"
    t.string "country"
    t.integer "gender"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies_journalists", id: false, force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "journalist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_companies_journalists_on_company_id"
    t.index ["journalist_id"], name: "index_companies_journalists_on_journalist_id"
  end

  create_table "consoles", force: :cascade do |t|
    t.string "name", null: false
    t.string "manufacturer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string "device_number"
    t.bigint "journalist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["journalist_id"], name: "index_devices_on_journalist_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "brand"
    t.string "name"
    t.string "unit"
    t.integer "packaging"
  end

  create_table "employees", id: :uuid, default: nil, force: :cascade do |t|
    t.string "name", limit: 50
    t.string "username", limit: 50
    t.string "password", limit: 50
    t.boolean "isactive"
  end

  create_table "items", force: :cascade do |t|
    t.string "sku"
    t.string "title"
    t.string "nickname"
    t.float "price", default: 0.0
    t.integer "inventory", default: 0
    t.string "fulfillment_fee"
    t.string "float"
    t.float "unit_cost", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journalists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "manager_id"
    t.decimal "salary", precision: 19, scale: 4
    t.integer "lock_version"
    t.integer "status"
    t.index ["manager_id"], name: "index_journalists_on_manager_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "purchase_order_id", null: false
    t.bigint "item_id", null: false
    t.string "currency"
    t.integer "quantity_ordered", default: 0
    t.integer "quantity_shipped", default: 0
    t.float "price", default: 0.0
    t.float "discount", default: 0.0
    t.float "tax", default: 0.0
    t.float "platform_fee", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["purchase_order_id"], name: "index_order_items_on_purchase_order_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.jsonb "metadata"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "pricing", id: { type: :string, limit: 38 }, force: :cascade do |t|
    t.string "title", limit: 255, default: "Default"
    t.decimal "price", precision: 19, scale: 4, default: "0.0"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.date "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "order_num"
    t.datetime "purchase_date"
    t.string "status"
    t.string "sales_channel"
    t.decimal "order_total", precision: 8, scale: 2, default: "0.0"
    t.integer "num_items_shipped", default: 0
    t.integer "num_items_unshipped", default: 0
    t.string "payment_method"
    t.datetime "shipped_at"
    t.float "shipping_price", default: 0.0
    t.float "shipping_tax", default: 0.0
    t.string "carrier"
    t.string "tracking_number"
    t.datetime "estimated_arrival_date"
    t.string "fulfillment_center"
    t.datetime "confirmed_at"
    t.datetime "returned_date"
    t.string "return_reason"
    t.text "notes"
    t.datetime "refunded_at"
    t.string "ship_to_name"
    t.string "ship_to_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "release_schedules", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.bigint "journalist_id"
    t.bigint "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_release_schedules_on_article_id"
    t.index ["journalist_id"], name: "index_release_schedules_on_journalist_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "twitter_account_id", null: false
    t.string "body"
    t.string "text"
    t.datetime "publish_at"
    t.string "tweet_id"
    t.string "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["twitter_account_id"], name: "index_tweets_on_twitter_account_id"
    t.index ["user_id"], name: "index_tweets_on_user_id"
  end

  create_table "twitter_accounts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "token"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_twitter_accounts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fails", limit: 2, default: 0
    t.datetime "failsuntil", precision: nil
  end

  add_foreign_key "bank_accounts", "suppliers"
  add_foreign_key "comments", "articles"
  add_foreign_key "journalists", "journalists", column: "manager_id"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "purchase_orders"
  add_foreign_key "tweets", "twitter_accounts"
  add_foreign_key "tweets", "users"
  add_foreign_key "twitter_accounts", "users"
end
