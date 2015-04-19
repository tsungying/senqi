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

ActiveRecord::Schema.define(version: 20150419073532) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "articles", force: :cascade do |t|
    t.integer  "blog_category_id", limit: 4
    t.string   "title",            limit: 255
    t.text     "summary",          limit: 65535
    t.text     "content",          limit: 65535
    t.string   "home_image",       limit: 255
    t.string   "article_image",    limit: 255
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "comments_count",   limit: 4,     default: 0
  end

  add_index "articles", ["blog_category_id"], name: "index_articles_on_blog_category_id", using: :btree

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "articles_count", limit: 4,   default: 0
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
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

  create_table "pictures", force: :cascade do |t|
    t.string   "img",         limit: 255
    t.integer  "parent_id",   limit: 4
    t.string   "parent_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
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
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "home_image",       limit: 255
    t.text     "youtube_code",     limit: 65535
  end

  add_index "products", ["prod_category_id"], name: "index_products_on_prod_category_id", using: :btree

end
