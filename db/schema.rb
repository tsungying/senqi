# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150504114158) do

  create_table "articles", force: :cascade do |t|
    t.integer  "blog_category_id", limit: 4
    t.string   "title",            limit: 255
    t.text     "summary",          limit: 65535
    t.text     "content",          limit: 65535
    t.string   "home_image",       limit: 255
    t.string   "article_image",    limit: 255
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "comments_count",   limit: 4,     default: 0
    t.string   "youtube_video",    limit: 255
    t.string   "cover",            limit: 255,   default: "article_image"
  end

  add_index "articles", ["blog_category_id"], name: "index_articles_on_blog_category_id", using: :btree

  create_table "atm_payment_infos", force: :cascade do |t|
    t.text     "raw_post_data",     limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "merchant_trade_no", limit: 255
    t.string   "trade_no",          limit: 255
    t.string   "bank_code",         limit: 255
    t.string   "v_account",         limit: 255
    t.datetime "expire_date"
    t.integer  "rtn_code",          limit: 4
    t.boolean  "verify_mac",        limit: 1
  end

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "articles_count", limit: 4,   default: 0
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",             limit: 255
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "company_profiles", force: :cascade do |t|
    t.string   "office_image", limit: 255
    t.integer  "play_order",   limit: 4,   default: 0
    t.string   "brand_story",  limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "event_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "events_count", limit: 4,   default: 0
  end

  create_table "events", force: :cascade do |t|
    t.integer  "event_category_id", limit: 4
    t.string   "title",             limit: 255
    t.text     "summary",           limit: 65535
    t.text     "content",           limit: 65535
    t.string   "home_image",        limit: 255
    t.string   "event_image",       limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "publish_at"
  end

  add_index "events", ["event_category_id"], name: "index_events_on_event_category_id", using: :btree

  create_table "home_pages", force: :cascade do |t|
    t.string   "logo",       limit: 255
    t.string   "slider",     limit: 255
    t.integer  "play_order", limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "raw_post_data",     limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "merchant_trade_no", limit: 255
    t.string   "trade_no",          limit: 255
    t.integer  "rtn_code",          limit: 4
    t.datetime "payment_date"
    t.boolean  "verify_mac",        limit: 1
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.decimal  "unit_price",            precision: 10
    t.integer  "quantity",    limit: 4
    t.decimal  "total_price",           precision: 10
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "cart_id",     limit: 4
  end

  add_index "order_items", ["cart_id"], name: "index_order_items_on_cart_id", using: :btree
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id", using: :btree

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",                      precision: 10
    t.decimal  "shipping_fee",                  precision: 10
    t.decimal  "total",                         precision: 10
    t.integer  "order_status_id",   limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "user_id",           limit: 4
    t.string   "name",              limit: 255
    t.string   "phone",             limit: 255
    t.string   "address",           limit: 255
    t.integer  "cart_id",           limit: 4
    t.integer  "payment_id",        limit: 4
    t.string   "merchant_trade_no", limit: 255
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id", using: :btree
  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id", using: :btree
  add_index "orders", ["payment_id"], name: "index_orders_on_payment_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "img",         limit: 255
    t.integer  "parent_id",   limit: 4
    t.string   "parent_type", limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "section",     limit: 255, default: "product_photo"
  end

  create_table "prod_categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "products_count", limit: 4,   default: 0
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "part_number",      limit: 255
    t.integer  "prod_category_id", limit: 4
    t.decimal  "original_price",                 precision: 10
    t.decimal  "selling_price",                  precision: 10
    t.text     "brief",            limit: 65535
    t.text     "description",      limit: 65535
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.string   "home_image",       limit: 255
    t.text     "youtube_code",     limit: 65535
    t.boolean  "active",           limit: 1,                    default: false
  end

  add_index "products", ["prod_category_id"], name: "index_products_on_prod_category_id", using: :btree

  create_table "terms_of_services", force: :cascade do |t|
    t.decimal  "shipping_fee",               precision: 10
    t.text     "terms",        limit: 65535
    t.text     "policy",       limit: 65535
    t.text     "disclaimer",   limit: 65535
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  limit: 1,   default: false
    t.string   "name",                   limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "authorizations", "users"
  add_foreign_key "order_items", "carts"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
end
