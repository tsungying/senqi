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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150403034707) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "blog_category_id"
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "home_image"
    t.string   "article_image"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "comments_count",   :default => 0
  end

  add_index "articles", ["blog_category_id"], :name => "index_articles_on_blog_category_id"

  create_table "blog_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "articles_count", :default => 0
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "name"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "event_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "events_count", :default => 0
  end

  create_table "events", :force => true do |t|
    t.integer  "event_category_id"
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "home_image"
    t.string   "event_image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.datetime "publish_at"
  end

  add_index "events", ["event_category_id"], :name => "index_events_on_event_category_id"

  create_table "pictures", :force => true do |t|
    t.string   "img"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "prod_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "products_count", :default => 0
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "part_number"
    t.integer  "prod_category_id"
    t.decimal  "original_price",   :precision => 10, :scale => 0
    t.decimal  "selling_price",    :precision => 10, :scale => 0
    t.text     "brief"
    t.text     "description"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "home_image"
  end

  add_index "products", ["prod_category_id"], :name => "index_products_on_prod_category_id"

end
